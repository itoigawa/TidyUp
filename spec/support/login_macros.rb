module LoginMacros
  def login_as(user)
    visit '/login'
    within "#login-form" do
      fill_in 'email', with: user.email
      fill_in 'password', with: '12345678'
      click_on 'ログイン'
    end
  end
end