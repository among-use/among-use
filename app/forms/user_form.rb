class UserForm
  include ActiveModel::Model

  attr_accessor :name, :message, :mattermost_times_url, :id

  with_options presence: true do
    validates :name
    validates :message, length: { maximum: 100 }
    validates :mattermost_times_url
  end

  def update
    user = User.find(id)
    user.update(name: name)
    profile = Profile.find_by(user_id: user.id)
    profile.update(message: message, mattermost_times_url: mattermost_times_url)
  end
end