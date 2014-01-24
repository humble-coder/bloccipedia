require 'spec_helper'

feature 'A member edits accessible private wiki' do

  let(:private_wiki) { create :wiki, :as_private, :with_collaborator }
  let(:collaborator) { private_wiki.users.first }
  
  before(:each) do
    login_as(collaborator, scope: :user)
    visit root_path
    click_link 'View Wikis'
    click_link 'My Private Wiki'
    click_link 'Edit Wiki'
  end

  scenario 'Successfully' do
    fill_in 'Body', with: 'updated body'
    click_button 'Update Wiki'

    expect(page).to have_content('updated body')
    expect(page).to have_content('Wiki was updated.')
  end

  scenario 'with missing title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'updated body'
    click_button 'Update Wiki'

    expect(page).to have_content('There was an error updating the wiki. Please try again.')
  end

  scenario 'with missing body' do
    fill_in 'Body', with: ''
    click_button 'Update Wiki'

    expect(page).to have_content('There was an error updating the wiki. Please try again.')
  end

  scenario 'with missing title and body' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Update Wiki'

    expect(page).to have_content('There was an error updating the wiki. Please try again.')
  end
end