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

    def free_user_signs_in(email = true, password = true, wrong_password = false, bad_email = false)
      user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email if email
      fill_in 'Email', with: "bad_email" if bad_email
      fill_in 'Password', with: user.password if password
      fill_in 'Password', with: "wrong_password" if wrong_password
      click_button 'Sign in'
    end

    def sign_out
      click_link 'Sign out'
    end

    def make_factory_wiki(public = true)
      public ? create(:wiki) : create(:wiki, :as_private)
    end

    def check_out_wikis
      make_factory_wiki
      visit wikis_path
    end

    def click_on_a_wiki
      make_factory_wiki
      visit wikis_path
      click_link 'My Wiki'
    end

    def login_to_upgrade_account
      user = create(:user)
      visit new_charge_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      click_button 'Pay with Card'
    end

    def fill_payment_form
      fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4242424242424242'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'
    end


    def premium_user_signs_in
      user = create(:user, :as_premium_user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    def make_private_wiki(collaborator = nil)
      visit new_wiki_path
      fill_in 'Title', with: 'My Private Wiki'
      fill_in 'Body', with: 'Some private content'
      uncheck 'wiki_public'
      select collaborator, from: "wiki[user_ids]" if collaborator
      click_button 'Make Wiki'
    end

    def make_public_wiki(title = true, body = true)
      visit new_wiki_path
      fill_in 'Title', with: 'My Public Wiki' if title
      fill_in 'Body', with: 'Some public content' if body
      click_button 'Make Wiki'
    end
  end
end