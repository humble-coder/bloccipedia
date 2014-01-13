require 'spec_helper'

feature 'User with free account', :js => true do
  scenario 'upgrades to premium account, using links on page' do
  	user = create(:user)
  	visit root_path
  	click_link 'Sign In'
  	fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Upgrade to Premium'
    click_button 'Pay with Card'

    Capybara.within_frame 'stripe_checkout_app' do
    	fill_payment_form
    end

    expect(page).to have_content('You are now a premium user!')
  end
end