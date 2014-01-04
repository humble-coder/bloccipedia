require 'spec_helper'

feature 'Premium user signs in and' do
  scenario 'makes a private wiki' do
    premium_user_signs_in
    make_private_wiki_as_user

    expect(page).to have_content('My Private Wiki')
  end
  scenario 'makes a public wiki' do
    premium_user_signs_in
    make_public_wiki_as_user

    expect(page).to have_content('My Public Wiki')
  end
end