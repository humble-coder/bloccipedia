require 'spec_helper'

feature 'A member signs out' do
  
  let(:user) { create :user }

  scenario 'Successfully' do
    login_as(user, scope: :user)
    visit root_path
    click_link 'Sign out'

    expect(page).to have_content("Signed out successfully")
  end
end