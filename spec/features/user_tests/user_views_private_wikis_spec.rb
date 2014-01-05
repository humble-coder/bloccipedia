require 'spec_helper'

feature 'a premium user creates a private wiki' do
  scenario 'and a guest user tries to view it' do
    premium_user_signs_in
    make_private_wiki_as_user
    sign_out
    visit wikis_path
    click_link 'My Private Wiki'

    expect(page).to have_content("You are not authorized to perform this action.")
  end

  scenario 'and the premium user tries to view it' do
    premium_user_signs_in
    make_private_wiki_as_user
    visit wikis_path
    click_link 'My Private Wiki'

    expect(page).to have_content("Some private content")
  end

end