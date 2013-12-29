module Features
  module SessionHelpers
    def sign_up_with(user_name, email, password, account)
      visit sign_up_path
      fill_in 'Username', with: user_name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      choose (account)
      click_button 'Sign up'
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'Username', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end