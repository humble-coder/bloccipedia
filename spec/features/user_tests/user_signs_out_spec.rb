require 'spec_helper'

feature 'User signs out' do
  scenario 'by clicking the sign-out link' do
    free_user_signs_in
    sign_out
    expect(page).to have_content("Signed out successfully")
  end
end