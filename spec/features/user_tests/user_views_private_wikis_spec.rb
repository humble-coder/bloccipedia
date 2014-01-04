require 'spec_helper'

feature 'a premium user creates both a private wiki and a public wiki' do
  scenario 'and another guest user tries to view them, but can only see the public wiki' do
    premium_user_signs_in
    make_private_wiki_as_user
    make_public_wiki_as_user
    sign_out
    visit wikis_path

    expect(page).not_to have_content("My Private Wiki")
    expect(page).to have_content("My Public Wiki")
  end

  scenario 'and the premium user can see both' do
    premium_user_signs_in
    make_private_wiki_as_user
    make_public_wiki_as_user
    visit wikis_path

    expect(page).to have_content("My Private Wiki")
    expect(page).to have_content("My Public Wiki")
  end

end