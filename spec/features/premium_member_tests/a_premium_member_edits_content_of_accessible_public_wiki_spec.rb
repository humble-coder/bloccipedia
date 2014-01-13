require 'spec_helper'

feature 'A premium user edits content of accessible public wiki' do

  before(:each) do
    user = create(:user, :as_premium_user)
    public_wiki = create(:wiki)
    user.wikis << public_wiki
    login_as(user, scope: :user)
    visit root_path
    click_link 'View Wikis'
    click_link 'My Public Wiki'
    click_link 'Edit Wiki'
  end

  scenario 'Successfully' do
    fill_in 'Title', with: 'Changed Title'
    fill_in 'Body', with: 'Changed Body'
    click_button 'Update Wiki'

    expect(page).to have_content('Changed Title')
    expect(page).to have_content('Changed Body')
  end

  scenario 'but erases the title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Changed Body'
    click_button 'Update Wiki'

    expect(page).to have_content('The wiki needs a title!')
  end

  scenario 'but erases the body' do
    fill_in 'Title', with: 'My Public Wiki'
    fill_in 'Body', with: ''
    click_button 'Update Wiki'

    expect(page).to have_content('The wiki needs a body!')
  end

  scenario 'but erases both the title and the body' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Update Wiki'

    expect(page).to have_content('The wiki needs a title and a body!')
  end
end
    





# scenario 'makes a private wiki and edits the title after creation' do
  #   premium_user_signs_in
  #   make_private_wiki
  #   click_link 'Edit Wiki'
  #   fill_in 'Title', with: 'Changed Title'
  #   click_button 'Update Wiki'

  #   expect(page).to have_content('Changed Title')
  #   expect(page).to have_content('Some private content')
  # end
