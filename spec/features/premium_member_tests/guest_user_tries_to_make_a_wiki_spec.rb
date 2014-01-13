require 'spec_helper'

feature 'Guest user tries to make a wiki' do
  scenario 'Unsuccessfully' do
    visit new_wiki_path
    
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end