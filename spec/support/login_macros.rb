module LoginMacros
  def login(user)
    visit login_path
    # fill_in 'メールアドレス', with: user.email
    # fill_in 'パスワード', with: user.password
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Confirm'
  end
end