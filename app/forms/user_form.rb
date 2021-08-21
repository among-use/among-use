class UserForm
  include ActiveModel::Model

  attr_accessor :name, :message, :mattermost_times_url, :id, :image

  validates :message, length: { maximum: 100 }

  def update
    return false if invalid?

    ActiveRecord::Base.transaction do
      user = User.find(id)
      user.update!(name: name)
      user.avatar.attach(image) if image.present?
      profile = Profile.find_by(user_id: user.id)
      if profile.present?
        profile.update!(message: message, mattermost_times_url: mattermost_times_url)
      else
        profile = user.build_profile(message: message, mattermost_times_url: mattermost_times_url)
        profile.save!
      end
    end

    true
  rescue StandardError
    false
  end
end