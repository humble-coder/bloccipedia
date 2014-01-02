require 'spec_helper'

feature 'New User signs up' do
  scenario 'with name, valid email, and password' do
    sign_up_with 'markb', 'valid@example.com', 'password', 'password'
    expect(page).to have_content('confirmation link')
  end

  scenario 'with blank username' do
    sign_up_with '', 'valid@example.com', 'password', 'password'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'with blank password' do
    sign_up_with 'markb', 'valid@example.com', '', ''
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'with mismatching passwords' do
    sign_up_with 'markb', 'valid@example.com', 'password', 'wrong_password'
    expect(page).to have_content("Password doesn't match confirmation")
  end

  scenario 'with invalid email' do
    sign_up_with 'markb', 'invalid_email', 'password', 'password'
    expect(page).to have_content("Email is invalid")
  end

  scenario 'with blank email' do
    sign_up_with 'markb', '', 'password', 'password'
    expect(page).to have_content("Email can't be blank")
  end
end