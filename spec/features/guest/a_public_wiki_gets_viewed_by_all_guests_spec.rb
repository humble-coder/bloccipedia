require 'spec_helper'

feature 'A public wiki gets viewed by all guests' do

	before(:each) do
		create(:wiki)
		visit root_path
	end

  scenario 'Successfully (through viewing the wiki listing)' do
    click_link 'View Wikis'

    expect(page).to have_content('My Public Wiki')
  end

  scenario 'Successfully (through clicking on the link to the public wiki to see its contents)' do
    click_link 'View Wikis'
    click_link 'My Public Wiki'
    
    expect(page).to have_content('My Public Wiki')
    expect(page).to have_content('Some content')
  end
end