require 'spec_helper'

feature 'A premium member removes collaborator from own wiki' do

  let(:private_wiki) { create :wiki, :as_private, :with_premium_user }
  let(:premium_user) { private_wiki.users.first }

  before(:each) do
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
