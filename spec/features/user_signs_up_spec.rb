require 'spec_helper'

feature 'User signs up' do
  scenario 'with username, valid email, password, free account' do
    sign_up_with 'markb', 'valid@example.com', 'my_password', 'Free'

    expect(page).to have_content('confirmation link')
  end

  scenario 'with username, valid email, password, premium account' do
    sign_up_with 'markb', 'valid@example.com', 'my_password', 'Premium'

    expect(page).to have_content('confirmation link')
  end

  # scenario 'with blank username' do
  #   sign_up_with '', 'valid@example.com', 'password', 'Free'

  #   expect(page).to have_content('Sign in')
  # end

  # scenario 'with blank password' do
  #   sign_up_with 'markb', 'valid@example.com', '', 'Premium'

  #   expect(page).to have_content('Sign in')
  # end

  # scenario 'with invalid email' do
  #   sign_up_with 'markb', 'invalid_email', 'password', 'Free'

  #   expect(page).to have_content('Sign in')
  # end
end