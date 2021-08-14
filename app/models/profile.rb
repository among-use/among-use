class Profile < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: { maximum: 100 }
  # validates :mattermost_times_url, presence: true
end
