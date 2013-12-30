module Features
  module SessionHelpers
    def sign_up_with(user_name, user_email, user_password, user_account)
      visit new_user_registration_path
      fill_in 'Name', with: user_name
      choose user_account
      fill_in 'Email', with: user_email
      fill_in 'Password', with: user_password
      fill_in 'Password confirmation', with: user_password
      click_button 'Sign up'
    end

    # def sign_in
    #   user = create(:user)
    #   visit sign_in_path
    #   fill_in 'Username', with: user.name
    #   fill_in 'Email', with: user.email
    #   fill_in 'Password', with: user.password
    #   click_button 'Sign in'
    # end
  end
end