class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one  :profile, dependent: :destroy
  has_many :events, through: :participants
  has_many :participants
  accepts_nested_attributes_for :participants
# has_many :participant_events, through: :participants, source: :event
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
end
