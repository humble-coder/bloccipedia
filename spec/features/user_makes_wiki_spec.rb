require 'spec_helper'

# In order to publish the documentation on my project
# As a project manager
# I need to create wikis that other employees can access.

feature 'New user with free account creates a public wiki' do
  scenario 'by signing in and making a wiki' do
    sign_in_with("valid@example.com", "password")
    make_wiki("Some Wiki", "Some Content")
    expect(page).to have_content("Wiki saved successfully")
  end

  scenario 'by signing in and making a wiki without a title' do
    sign_in_with("valid@example.com", "password")
    make_wiki("", "Some Content")
    expect(page).to have_content("There was an error saving your wiki.")
  end

  scenario 'by signing in and making a wiki without a body' do
    sign_in_with("valid@example.com", "password")
    make_wiki("Some Wiki", "")
    expect(page).to have_content("There was an error saving your wiki.")
  end

end