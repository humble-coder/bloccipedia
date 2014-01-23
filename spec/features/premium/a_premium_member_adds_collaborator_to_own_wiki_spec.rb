require 'spec_helper'

feature 'A premium member adds collaborator to own wiki' do

  let(:premium_user) { create :user, :as_premium_user, :with_private_wiki }
  let(:collaborator) { create :user }

  scenario 'Successfully' do
    visit root_path
    login_as(premium_user, scope: :user)
    click_link 'View Wikis'
    click_link 'My Private Wiki'
    fill_in 'search', with: collaborator.name
    click_button 'Search'
    click_link 'Add'

  	expect(page).to have_content('Collaborator markb Added')
  end
end