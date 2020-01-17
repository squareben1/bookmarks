require 'bookmarks'
require 'database_helpers'

feature 'deleting bookmarks' do
  scenario 'deletes record from DB by entering title of target record' do 
    visit('/')
    fill_in :delete, with: 'Facebook'
    click_button 'Delete'
    expect(page).to have_content 'Facebook deleted.'
  end 
end 