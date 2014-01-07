require 'spec_helper'

feature 'a premium user creates a private wiki' do
  scenario 'and a guest user tries to view it' do
    premium_user_signs_in
    make_private_wiki
    sign_out
    visit wikis_path

    expect(page).not_to have_content("My Private Wiki")
  end

  scenario 'and the premium user tries to view it' do
    premium_user_signs_in
    make_private_wiki
    visit wikis_path
    click_link 'My Private Wiki'

    expect(page).to have_content("Some private content")
  end

end