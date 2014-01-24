require 'spec_helper'

feature 'A member deletes own public wiki' do

  let(:user) { create :user, :with_public_wiki}

  scenario 'Successfully' do
    login_as(user, scope: :user)
    visit root_path
	  click_link 'View Wikis'
	  click_link 'My Public Wiki'
	  click_link 'Delete'

	  expect(page).to have_content("'My Public Wiki' was deleted successfully.")
  end
end