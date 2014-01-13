require 'spec_helper'

feature 'A member makes a public wiki' do

  before(:each) do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
  end

  scenario 'Successfully' do
    click_link 'Create a Wiki'
    fill_in 'Title', with: 'My Public Wiki'
    fill_in 'Body', with: 'My public content'
    click_button 'Make Wiki'

    expect(page).to have_content('My Public Wiki My public content')
  end

  scenario 'without a title' do
    click_link 'Create a Wiki'
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'My public content'
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a title!')
  end

  scenario 'without a body' do
    click_link 'Create a Wiki'
    fill_in 'Title', with: 'My Public Wiki'
    fill_in 'Body', with: ''
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a body!')
  end

  scenario 'without a body or a title' do
    click_link 'Create a Wiki'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Make Wiki'

    expect(page).to have_content('Your wiki needs a title and a body!')
  end


  # scenario 'and logs in and makes a public wiki with the links at the top of the page' do
  # 	free_user_signs_in
  # 	click_link 'Create a Wiki'
  # 	fill_in 'Title', with: 'My Public Wiki'
  # 	fill_in 'Body', with: 'My public content'
  # 	click_button 'Make Wiki'

  # 	expect(page).to have_content('My Public Wiki')
  # 	expect(page).to have_content('My public content')
  # end

  # scenario 'and logs in (as a premium user) and makes a public wiki with the links at the top of the page' do
  # 	premium_user_signs_in
  # 	click_link 'Create a Wiki'
  # 	fill_in 'Title', with: 'My Public Wiki'
  # 	fill_in 'Body', with: 'My public content'
  # 	click_button 'Make Wiki'

  # 	expect(page).to have_content('My Public Wiki')
  # 	expect(page).to have_content('My public content')
  # end

  # scenario 'and logs in (as a premium user) user and makes a private wiki with the links at the top of the page' do
  # 	premium_user_signs_in
  # 	click_link 'Create a Wiki'
  # 	fill_in 'Title', with: 'My Private Wiki'
  # 	fill_in 'Body', with: 'My private content'
  # 	uncheck 'wiki_public'
  # 	click_button 'Make Wiki'

  # 	expect(page).to have_content("(Private)")
  # 	expect(page).to have_content('My Private Wiki')
  # 	expect(page).to have_content('My private content')
  # end

  # scenario 'and logs in to view the (public) wiki already present' do
  # 	make_factory_wiki
  # 	free_user_signs_in
  # 	click_link 'View Wikis'

  # 	expect(page).to have_content('My Wiki')
  # end

  # scenario 'and logs in to view the public wiki and the private wiki already present' do
  #   make_factory_wiki(public = false)
  #   make_factory_wiki
  #   free_user_signs_in
  #   click_link 'View Wikis'

  #   expect(page).to have_content('My Wiki')
  #   expect(page).not_to have_content('My Private Wiki')
  # end

end