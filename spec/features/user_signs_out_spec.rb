require 'spec_helper'

feature 'User signs out' do
  scenario 'by clicking the sign-out link' do
    sign_in_with 'valid@example.com', 'password'
    sign_out
    expect(page).to have_content("Signed out successfully")
  end
end