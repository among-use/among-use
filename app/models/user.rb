class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one  :profiles, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
# has_many :participant_events, through: :participants, source: :event

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # validates :reset_password_token, uniqueness: true, allow_nil: true
  # 必要であれば上記カラムを追加
  enum role: { general: 0, admin: 0 }
end
