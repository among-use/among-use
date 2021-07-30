user = User.create!(
  name: "foo",
  email: "foo@example.com",
  password: "password",
  password_confirmation: "password"
)

10.times do
  User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: "12345678",
  password_confirmation: "12345678"
  )
end

(1..11).each do |i|
  User.find(i).create_profile!(
    message: "message#{i}",
    mattermost_times_url: "matamo_url#{i}"
  )
end
