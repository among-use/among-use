RSpec.configure do |config|
  # ブラウザを非表示でテストする
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
  end
  # # ブラウザを表示してテストする
  # config.before(:each, type: :system) do
  #   driven_by :selenium_chrome
  # end
end