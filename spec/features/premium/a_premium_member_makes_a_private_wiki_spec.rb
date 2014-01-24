require 'spec_helper'

feature 'A premium member makes a private wiki' do

  let(:premium_user) { create :user, :as_premium_user }
  let(:collaborator) { create :user }

  before(:each) do
    login_as(premium_user, scope: :user)
    visit root_path
    click_link 'Create a Wiki'
  end

  scenario 'Successfully' do
    fill_in 'Title', with: 'My Private Wiki'
    fill_in 'Body', with: 'Some private content'
    uncheck 'wiki_public'
    click_button 'Make Wiki'
    
    expect(page).to have_content('My Private Wiki')
    expect(page).to have_content('Some private content')
  end

  scenario 'Successfully with a collaborator' do
    fill_in 'Title', with: 'My Private Wiki'
    fill_in 'Body', with: 'Some private content'
    click_button 'Make Wiki'
    fill_in 'search', with: collaborator.name
    click_button 'Search'
    click_link 'Add'

    expect(page).to have_content('My Private Wiki')
    expect(page).to have_content('Some private content')
    expect(page).to have_content('Collaborator markb Added')
  end

  scenario 'without a title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Some private content'
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content("Title can't be blank")
  end

  scenario 'without a body' do
    fill_in 'Title', with: 'My Private Wiki'
    fill_in 'Body', with: ''
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content("Body can't be blank")
  end

  scenario 'without either a title or a body' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end