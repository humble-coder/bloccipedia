 # scenario 'makes a private wiki, adds a collaborator, and then removes the collaborator' do
  #   create(:user)
  #   premium_user_signs_in
  #   make_private_wiki('markb')
  #   click_link 'Remove markb' # To remove markb as a collaborator
    
  #   expect(page).to have_content('Collaborator removed.')
  #   expect(page).not_to have_content('markb')
  # end

  require 'spec_helper'

  feature 'A premium member removes collaborator from own wiki' do
  	