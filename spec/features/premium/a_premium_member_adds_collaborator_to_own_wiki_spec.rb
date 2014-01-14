require 'spec_helper'

feature 'A premium member adds collaborator to own wiki' do

  before(:each) do
  	private_wiki = create(:wiki, :as_private)
  	premium_user = create(:user, :as_premium_user)
  	premium_user.wikis << private_wiki
  	private_wiki.users << premium_user
    collaborator = create(:user)
    visit root_path
    login_as(premium_user, scope: :user)
  end

  scenario 'Successfully' do
    click_link 'View Wikis'
    click_link 'My Private Wiki'
    click_link 'Edit Wiki'
    check 'markb'
    click_button 'Update Wiki'

  	expect(page).to have_content('markb')
  end
end