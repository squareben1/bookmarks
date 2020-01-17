require 'bookmarks'
require 'database_helpers'

feature 'deleting bookmarks' do
  scenario 'deletes record from DB by entering title of target record' do 
    visit('/')
    click_button 'Delete Record?'
    fill_in :delete_title, with: 'Facebook'
    click_button 'Delete'
    expect(page).to have_content 'Facebook has been deleted.'
  end 
end 