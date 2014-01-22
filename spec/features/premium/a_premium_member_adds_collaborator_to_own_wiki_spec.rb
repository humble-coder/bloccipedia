require 'spec_helper'

feature 'A premium member adds collaborator to own wiki' do

  let(:private_wiki) { create :wiki, :as_private, :with_premium_user }
  let(:premium_user) { private_wiki.users.first }
  let(:collaborator) { create :user }

  before(:each) do
    visit root_path
    login_as(premium_user, scope: :user)
  end

  scenario 'Successfully' do
    click_link 'View Wikis'
    click_link 'My Private Wiki'
    fill_in 'search', with: collaborator.name
    click_button 'Search'
    click_link 'Add'

  	expect(page).to have_content('Collaborator markb Added')
  end
end