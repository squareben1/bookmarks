feature 'Viewing bookmarks' do
  scenario 'visiting index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  xscenario 'visiting bookmark page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario 'visiting bookmark page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    
    visit('/bookmarks')
    expect(page).to have_content "Makers"
    # expect(page).to have_content "http://www.destroyallsoftware.com"
    # expect(page).to have_content "http://www.google.com"
  end 
end
