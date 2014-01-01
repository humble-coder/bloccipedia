module Features
  module SessionHelpers
    def sign_up_with(user_name, user_email, user_password, password_confirmation)
      visit new_user_registration_path
      fill_in 'Name', with: user_name
      #choose user_account
      fill_in 'Email', with: user_email
      fill_in 'Password', with: user_password
      fill_in 'Password confirmation', with: password_confirmation
      click_button 'Sign up'
    end

    def sign_in_with(user_email, user_password)
      user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user_email
      fill_in 'Password', with: user_password
      click_button 'Sign in'
    end

    def sign_out
      click_link 'Sign out'
    end

    def make_wiki_as_signed_in_user(title, body)
      visit new_wiki_path
      fill_in 'Title', with: title
      fill_in 'Body', with: body
      click_button 'Make Wiki'
    end

    def make_wiki
      create(:wiki)
    end

    def check_out_wikis
      make_wiki
      visit wikis_path
    end

    def click_on_a_wiki
      make_wiki
      visit wikis_path
      click_link 'My Wiki'
    end
  end
end