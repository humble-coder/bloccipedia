require 'spec_helper'

feature 'A member edits own public wiki' do
  
  let(:member_user) { create :user, :with_public_wiki }

  before(:each) do
    login_as(member_user, scope: :user)
    visit root_path
    click_link 'View Wikis'
    click_link 'My Public Wiki'
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