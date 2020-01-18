require 'bookmarks'
require 'database_helpers'

feature 'deleting bookmarks' do
  scenario 'deletes record from DB by entering title of target record' do 
    Bookmark.add(title: 'Youtube', url: 'http://www.youtube.com')
    visit('/')
    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
    click_button 'Delete Record'
    fill_in :delete_title, with: 'Youtube'
    click_button 'Delete'
    expect(page).to have_content 'Youtube has been deleted.'
    visit('/')
    expect(page).not_to have_link('Youtube', href: 'http://www.youtube.com')
  end 
end 