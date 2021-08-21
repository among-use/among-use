class Profile < ApplicationRecord
  belongs_to :user

  validates :message, length: { maximum: 100 }
  # validates :mattermost_times_url, presence: true
end
