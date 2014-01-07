require 'spec_helper'

feature 'Guest user visits site' do
  scenario 'and tries to make a wiki' do
    visit new_wiki_path
    
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end