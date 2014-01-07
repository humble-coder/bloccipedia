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
end