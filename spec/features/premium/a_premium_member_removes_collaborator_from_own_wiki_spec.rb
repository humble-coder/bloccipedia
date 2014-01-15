require 'spec_helper'

feature 'A premium member removes collaborator from own wiki' do

  before(:each) do
  	private_wiki = create(:wiki, :as_private)
  	premium_user = create(:user, :as_premium_user)
  	premium_user.wikis << private_wiki
  	private_wiki.users << premium_user
    private_wiki.users << create(:user)
    login_as(premium_user, scope: :user)
  	visit root_path
  end

  scenario 'Successfully' do
  	click_link 'View Wikis'
  	click_link 'My Private Wiki'
  	click_link 'Remove'

  	expect(page).to have_content('Collaborator markb Removed')
  end
end
