require 'spec_helper'

feature 'User signs in' do
  scenario 'with username, valid email, and password' do
    sign_in_with 'markb', 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

#   scenario 'with blank username' do
#     sign_in_with '', 'valid@example.com', 'password'

#     expect(page).to have_content('Sign in')
#   end

#   scenario 'with blank password' do
#     sign_in_with 'markb', 'valid@example.com', ''

#     expect(page).to have_content('Sign in')
#   end

#   scenario 'with invalid email' do
#     sign_in_with 'markb', 'invalid_email', 'password'

#     expect(page).to have_content('Sign in')
#   end
# end