require 'spec_helper'

feature 'User creates wiki' do
  scenario 'by signing in and making a public wiki' do
    make_wiki
    save_and_open_page
    expect(page).to have_content("Wiki saved successfully")
  end

end