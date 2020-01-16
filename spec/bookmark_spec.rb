# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '#all' do
    xit 'returns all bookamrks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#add' do 
    it 'adds a new bookmark and shows the TITLE' do 
      Bookmark.add('Facebook', 'http://www.facebook.com')
      bookmarks = Bookmark.all
      # p "-----bookmarks: *#{bookmarks}*------"
      expect(bookmarks).to include("Facebook")
    end 
  end 


end
