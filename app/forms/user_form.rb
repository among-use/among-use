class UserForm
  include ActiveModel::Model

  attr_accessor :name, :message, :mattermost_times_url, :id

  with_options presence: true do
    validates :name
    validates :message, length: { maximum: 100 }
    # validates :mattermost_times_url
  end

  def update
    # binding.pry
    return false if invalid?

    ActiveRecord::Base.transaction do
      user = User.find(id)
      user.update!(name: name)
      profile = Profile.find_by(user_id: user.id)
      if profile.present?
      profile.update!(message: message, mattermost_times_url: mattermost_times_url)
      else
        # debugger
      # profile = user.profile.new
      profile = user.build_profile
      profile.save(message: message, mattermost_times_url: mattermost_times_url)
      end
    end

    true
  end
end