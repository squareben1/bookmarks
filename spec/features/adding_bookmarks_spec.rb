feature 'adding bookmarks' do
  scenario 'check user can add new bookmark with a TITLE' do
    visit ('/')
    fill_in :title, with: 'Facebook'
    fill_in :bookmark, with: 'http://www.facebook.com'
    click_button 'Add'
    expect(page).to have_content 'Facebook'
  end
end