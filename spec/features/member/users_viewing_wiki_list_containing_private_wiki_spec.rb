require 'spec_helper'

feature 'Users viewing wiki list containing private wiki' do

  before(:each) do
    visit root_path
  end

  scenario 'guest user views the wiki list' do
    create(:wiki, :as_private)
    click_link 'View Wikis'

    expect(page).not_to have_content("My Private Wiki")
  end

  scenario 'premium user with a private wiki views the wiki list for his/her own private wiki' do
    user = create(:user, :as_premium_user, :with_private_wiki)
    login_as(user, scope: :user)
    click_link 'View Wikis'

    expect(page).to have_content("My Private Wiki")
  end

  scenario 'member user without access to private wiki views the wiki list' do
    user = create(:user)
    create(:wiki, :as_private)
    login_as(user, scope: :user)
    click_link 'View Wikis'

    expect(page).not_to have_content("My Private Wiki")
  end

  scenario 'member user with access to private wiki views the wiki list' do
    wiki = create(:wiki, :as_private, :with_collaborator)
    user = wiki.users.first
    login_as(user, scope: :user)
    click_link 'View Wikis'

    expect(page).to have_content("My Private Wiki")
  end

end