require 'spec_helper'

feature 'User with free account', :js => true do
  scenario 'upgrades to premium' do
    login_to_upgrade_account

    Capybara.within_frame 'stripe_checkout_app' do
      fill_payment_form
    end
    expect(page).to have_content('Thanks')
  end
end