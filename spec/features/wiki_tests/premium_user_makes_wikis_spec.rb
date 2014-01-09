require 'spec_helper'

feature 'Premium user signs in and' do
  scenario 'makes a private wiki' do
    premium_user_signs_in
    make_private_wiki

    expect(page).to have_content('Some private content')
  end

  scenario 'makes a public wiki' do
    premium_user_signs_in
    make_public_wiki

    expect(page).to have_content('Some public content')
  end

  scenario 'makes a private wiki with a collaborator' do
    create(:user)
    premium_user_signs_in
    make_private_wiki('markb')

    expect(page).to have_content('Some private content')
    expect(page).to have_content('markb')
  end

  scenario 'makes a private wiki and edits the title after creation' do
    premium_user_signs_in
    make_private_wiki
    click_link 'Edit Wiki'
    fill_in 'Title', with: 'Changed Title'
    click_button 'Update Wiki'

    expect(page).to have_content('Changed Title')
    expect(page).to have_content('Some private content')
  end

  scenario 'makes a private wiki and edits the body after creation' do
    premium_user_signs_in
    make_private_wiki
    click_link 'Edit Wiki'
    fill_in 'Body', with: 'Changed Body'
    click_button 'Update Wiki'

    expect(page).to have_content('Changed Body')
    expect(page).to have_content('My Private Wiki')
  end

  scenario 'makes a private wiki, adds a collaborator, and then removes the collaborator' do
    create(:user)
    premium_user_signs_in
    make_private_wiki('markb')
    click_link 'Remove markb' # To remove markb as a collaborator
    
    expect(page).to have_content('Collaborator removed.')
    expect(page).not_to have_content('markb')
  end

end