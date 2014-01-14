require 'spec_helper'

feature 'A premium member makes a private wiki' do

  before(:each) do
    user = create(:user, :as_premium_user)
    login_as(user, scope: :user)
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
    collaborator = create(:user)
    visit new_wiki_path # to reload page so that collaborator, a user, is available in the options of the 'wiki[user_ids]' collection select
    fill_in 'Title', with: 'My Private Wiki'
    fill_in 'Body', with: 'Some private content'
    uncheck 'wiki_public'
    check collaborator.name
    click_button 'Make Wiki'

    expect(page).to have_content('My Private Wiki')
    expect(page).to have_content('Some private content')
    expect(page).to have_content('markb')
  end

  scenario 'without a title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Some private content'
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a title!')
  end

  scenario 'without a body' do
    fill_in 'Title', with: 'My Private Wiki'
    fill_in 'Body', with: ''
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a body!')
  end

  scenario 'without either a title or a body' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    uncheck 'wiki_public'
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a title and a body!')
  end
end