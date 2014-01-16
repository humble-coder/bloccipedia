require 'spec_helper'

feature 'A member signs in' do

  before(:each) do
    user = create(:user)
    visit root_path
    click_link 'Sign In'
  end

  scenario 'Successfully' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with blank password' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: ''
    click_button 'Sign in'
    
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with wrong password' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with blank email' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with wrong email' do
    fill_in 'Email', with: 'not_my_email@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with invalid email' do
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end
end