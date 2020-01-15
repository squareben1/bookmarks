feature 'adding bookmarks' do
  scenario 'check user can add new bookmark' do
    visit ('/')
    fill_in 'bookmark', with: 'http://www.facebook.com'
    click_button 'Add'
    expect(page).to have_content 'http://www.facebook.com'
  end
end