require 'spec_helper'

# In order to publish the documentation on my project
# As a project manager
# I need to create wikis that other employees can access.

feature 'Free user with free account creates a public wiki' do
  scenario 'by signing in and making a wiki' do
    free_user_signs_in
    make_public_wiki

    expect(page).to have_content("Wiki saved successfully")
  end

  scenario 'by signing in and making a wiki without a title' do
    free_user_signs_in
    make_public_wiki(title = false)

    expect(page).to have_content("There was an error saving your wiki.")
  end

  scenario 'by signing in and making a wiki without a body' do
    free_user_signs_in
    make_public_wiki(body = false)

    expect(page).to have_content("There was an error saving your wiki.")
  end

  scenario 'by signing in and making a wiki without a body or a title' do
    free_user_signs_in
    make_public_wiki(title = false, body = false)

    expect(page).to have_content("There was an error saving your wiki.")
  end
end