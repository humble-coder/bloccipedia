require 'spec_helper'

feature 'A member upgrades to premium', js: true do
  
  let(:user) { create :user }

  before(:each) do
    login_as(user, scope: :user)
    visit root_path
  end

  scenario 'Successfully' do
    click_link 'Upgrade to Premium'
    click_button 'Pay with Card'

    Capybara.within_frame 'stripe_checkout_app' do
    	fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4242424242424242'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'
    end

    expect(page).to have_content('You are now a premium user!')
  end

  scenario 'with invalid credit-card information' do
    click_link 'Upgrade to Premium'
    click_button 'Pay with Card'
    
    Capybara.within_frame 'stripe_checkout_app' do
      fill_in 'Email', with: 'valid@example.com'
      fill_in 'Card number', with: '4242424242424243'
      fill_in 'CVC', with: '123'
      fill_in 'MM / YY', with: '1015'
      click_button 'Pay $5.00'
    end

    expect(page).not_to have_content('You are now a premium user!')
  end
end