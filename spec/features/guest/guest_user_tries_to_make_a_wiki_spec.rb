require 'spec_helper'

feature 'Guest user tries to make a wiki' do
  scenario 'Unsuccessfully' do
    visit new_wiki_path # The guest doesn't see the link to create a wiki, so this ensures that the create-wiki page is protected.
    
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end