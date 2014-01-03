
feature 'Premium user signs in' do
  scenario 'and makes a private wiki' do
    sign_in_as_premium_user
    make_private_wiki_as_premium_user

    expect(page).to have_content("My Private Wiki")
  end
end