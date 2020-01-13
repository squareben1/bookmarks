# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    # @bookmarks = Bookmark_List.new
    # @bookmarks.all
    @bookmarks = Bookmark.all

    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
