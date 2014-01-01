require 'spec_helper'

feature 'Public wikis get viewed by' do
  scenario 'any user checking out the list of wikis' do
    check_out_wikis
    expect(page).to have_content('My Wiki')
  end

  scenario 'any user clicking one of the wikis' do
    click_on_a_wiki
    expect(page).to have_content('Some content')
  end
end