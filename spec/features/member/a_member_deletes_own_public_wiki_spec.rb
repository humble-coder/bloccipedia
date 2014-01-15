require 'spec_helper'

feature 'A member deletes own public wiki' do

  before(:each) do
    user = create(:user)
    wiki = create(:wiki)
    user.wikis << wiki
    login_as(user, scope: :user)
    visit root_path
  end
	
  scenario 'Successfully' do
	click_link 'View Wikis'
	click_link 'My Public Wiki'
	click_link 'Delete'

	expect(page).to have_content("'My Public Wiki' was deleted successfully.")
  end
end