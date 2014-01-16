require 'spec_helper'

feature 'Guest user tries to edit a wiki' do
  scenario 'Unsuccessfully' do
  	wiki = create(:wiki)
    visit edit_wiki_path(wiki)
    
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end