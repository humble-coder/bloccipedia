require 'spec_helper'

feature 'A premium member removes collaborator from own wiki' do

  let(:premium_user) { create :user, :as_premium_user, :with_private_wiki_with_collaborator }

  scenario 'Successfully' do
    login_as(premium_user, scope: :user)
    visit root_path
  	click_link 'View Wikis'
  	click_link 'My Private Wiki'
  	click_link 'Remove'

  	expect(page).to have_content('Collaborator markb Removed')
  end
end
