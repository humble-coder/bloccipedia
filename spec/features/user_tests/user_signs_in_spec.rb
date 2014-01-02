require 'spec_helper'

feature 'User signs in' do
  scenario 'with correct email and correct password' do
    sign_in_with 'valid@example.com', 'password'
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with wrong password' do
    sign_in_with 'valid@example.com', 'wrong_password'
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with blank email' do
    sign_in_with '', 'password'
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'
    expect(page).to have_content('Invalid email or password')
  end
end