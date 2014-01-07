require 'spec_helper'

feature 'Free User signs in' do
  scenario 'with correct email and correct password' do
    free_user_signs_in
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with blank password' do
    free_user_signs_in(password = false)
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with wrong password' do
    free_user_signs_in(password = false, wrong_password = true)
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with blank email' do
    free_user_signs_in(email = false)
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with wrong email' do
    free_user_signs_in(email = false, wrong_email = true)
    expect(page).to have_content('Invalid email or password')
  end
end