feature 'updating bookmarks' do
  scenario 'user can update existing bookmark' do 
    Bookmark.add(title: 'Youtube', url: 'http://www.youtube.com')
    visit('/')
    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
    
    click_button 'Update Record'
    
    fill_in :target_title, with: 'Youtube'
    fill_in :update_title, with: 'Pootube'
    fill_in :update_url, with: 'http://www.pootube.com'
    click_button 'Update'
    
    expect(current_path).to eq '/'
    expect(page).not_to have_link('Youtube', href: 'http://www.youtube.com')
    expect(page).to have_link('Pootube', href: 'http://www.pootube.com')
  end 
end 