class User < ApplicationRecord
  before_create :default_image

  authenticates_with_sorcery!
  has_one  :profile, dependent: :destroy
  has_many :events, through: :participants
  has_many :participants
  has_many :participant_events, through: :participants, source: :event
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # validates :reset_password_token, uniqueness: true, allow_nil: true
  # 必要であれば上記カラムを追加
  enum role: { general: 0, admin: 1 }

  has_one_attached :avatar

  def default_image
    if !self.avatar.attached?
      array = ['black_plant', 'white_plant','yellow_plant','red_plant','purple_plant','pink_plant','orange_plant','lightgreen_plant','green_plant','sian_plant','brown_plant','blue_plant',]
      file_name = array.sample
      # self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.png')), filename: 'avatar.png', content_type: 'image/png')
      self.avatar.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', "#{file_name}.png")), filename: 'avatar.png', content_type: 'image/jpg')
    end
  end

  def participant(event)
    participant_events << event
  end

  def unparticipant(event)
    participant_events.delete(event)
  end

  def participant?(event)
    participant_events.include?(event)
  end

  def own?(object)
    id == object.user_id
  end
end
