require 'spec_helper'

feature 'A new member signs up' do

  before(:each) do
    visit root_path
    click_link "Sign Up"
  end

  scenario 'Successfully' do
    fill_in 'Name', with: "Mark"
    fill_in 'Email', with: "valid@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("confirmation link")
  end

  scenario 'with blank name' do
    fill_in 'Name', with: ""
    fill_in 'Email', with: "valid@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'with blank password' do
    fill_in 'Name', with: "Mark"
    fill_in 'Email', with: "valid@example.com"
    fill_in 'Password', with: ""
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("Password can't be blank")
  end

  scenario 'with mismatching passwords' do
    fill_in 'Name', with: "Mark"
    fill_in 'Email', with: "valid@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "wrong_password"
    click_button 'Sign up'

    expect(page).to have_content("Password doesn't match confirmation")
  end

  scenario 'with invalid email' do
    fill_in 'Name', with: "Mark"
    fill_in 'Email', with: "invalid_email"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("Email is invalid")
  end

  scenario 'with blank email' do
    fill_in 'Name', with: "Mark"
    fill_in 'Email', with: ""
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("Email can't be blank")
  end
end