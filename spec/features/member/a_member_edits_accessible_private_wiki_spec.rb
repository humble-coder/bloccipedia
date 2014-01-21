require 'spec_helper'

feature 'A member edits accessible private wiki' do
  
  before(:each) do
    member_user = create(:user)
    premium_user = create(:user, :as_premium_user)
    private_wiki = create(:wiki, :as_private)
    private_wiki.users << premium_user
    premium_user.wikis << private_wiki
    private_wiki.users << member_user
    login_as(member_user, scope: :user)
    visit root_path
  end

  scenario 'Successfully' do
    click_link 'View Wikis'
    click_link 'My Private Wiki'
    click_link 'Edit Wiki'
    fill_in 'Body', with: 'updated body'
    click_button 'Update Wiki'

    expect(page).to have_content('updated body')
    expect(page).to have_content('Wiki was updated.')
  end
end