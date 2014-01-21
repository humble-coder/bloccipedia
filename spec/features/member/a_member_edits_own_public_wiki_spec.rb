require 'spec_helper'

feature 'A member edits own public wiki' do
  
  before(:each) do
    user = create(:user)
    wiki = create(:wiki)
    wiki.users << user
    user.wikis << wiki
    login_as(user, scope: :user)
    visit root_path
  end

  scenario 'Successfully' do
    click_link 'View Wikis'
    click_link 'My Public Wiki'
    click_link 'Edit Wiki'
    fill_in 'Body', with: 'updated body'
    click_button 'Update Wiki'

    expect(page).to have_content('updated body')
    expect(page).to have_content('Wiki was updated.')
  end
end