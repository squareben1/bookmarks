feature 'adding a new bookmark' do
  scenario 'a user can add new bookmark with a TITLE' do
    visit ('/')
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com'
    click_button 'Add'
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end