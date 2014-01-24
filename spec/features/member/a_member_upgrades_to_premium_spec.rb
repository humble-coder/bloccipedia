require 'spec_helper'

feature 'A member upgrades to premium', js: true do
  
  let(:user) { create :user }

  before(:each) do
    login_as(user, scope: :user)
    visit root_path
    click_link 'Upgrade to Premium'
    click_button 'Pay with Card'
  end

  scenario 'Successfully' do
    Capybara.within_frame 'stripe_checkout_app' do
    	fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4242424242424242'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'
    end

    expect(page).to have_content('You are now a premium user!')
  end

  scenario 'with bad credit card' do   
    Capybara.within_frame 'stripe_checkout_app' do
      fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4000000000000002'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'

      expect(page).to have_content('This card was declined')
    end

    expect(page).not_to have_content('You are now a premium user!')
  end

  scenario 'with incorrect cvc code' do
    Capybara.within_frame 'stripe_checkout_app' do
      fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4000000000000127'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'
      dialog = page.driver.browser.switch_to.alert
      dialog.text.should == "Your card's security code is incorrect."
      dialog.dismiss
    end
  end
end