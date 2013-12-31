require 'spec_helper'

feature 'User creates wiki' do
  scenario 'by making a public wiki' do
    make_wiki
    expect(page).to have_content ("Wiki saved successfully")
  end

  
end