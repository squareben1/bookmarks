require 'bookmarks'

describe Bookmark do 
  describe '#akk' do 
    it 'returns all bookamrks' do 
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
    end 
  end 
end 