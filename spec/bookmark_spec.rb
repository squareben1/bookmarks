# frozen_string_literal: true

require 'bookmarks'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'returns all bookamrks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title:'Makers Academy')
      Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add(url: "http://www.google.com", title: "Google")
      # removed '1,' from first position of VALUES
      # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#add' do 
    it 'adds a new bookmark' do 
      bookmark = Bookmark.add(title: 'Facebook', url: 'http://www.facebook.com')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      # expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Facebook'
      expect(bookmark.url).to eq 'http://www.facebook.com'
    end 
  end 

  describe '#delete' do 
    it 'deletes a record from the database' do 
      bookmark = Bookmark.add(title: 'Facebook', url: 'http://www.facebook.com')
      persisted_data = persisted_data(id: bookmark.id)
      bookmark.delete(delete_target: 'Facebook')
      expect(bookmark.title).not_to eq 'Facebook'
      expect(bookmark.url).not_to eq 'http://www.facebook.com'
    end 
  end 

end
