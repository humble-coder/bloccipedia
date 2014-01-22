require 'spec_helper'

feature 'A member makes a public wiki' do

  let(:user) { create :user }

  before(:each) do
    login_as(user, scope: :user)
    visit root_path
    click_link 'Create a Wiki'
  end

  scenario 'Successfully' do
    fill_in 'Title', with: 'My Public Wiki'
    fill_in 'Body', with: 'My public content'
    click_button 'Make Wiki'

    expect(page).to have_content('My Public Wiki My public content')
  end

  scenario 'without a title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'My public content'
    click_button 'Make Wiki'

    expect(page).to have_content("Title can't be blank")
  end

  scenario 'without a body' do
    fill_in 'Title', with: 'My Public Wiki'
    fill_in 'Body', with: ''
    click_button 'Make Wiki'

    expect(page).to have_content("Body can't be blank")
  end

  scenario 'without a body or a title' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Make Wiki'

    expect(page).to have_content("Title can't be blank") 
    expect(page).to have_content("Body can't be blank")
  end
end