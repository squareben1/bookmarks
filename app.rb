# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :'bookmarks/index'
  end

  post '/add_bookmark' do
    Bookmark.add(params[:title], params[:bookmark])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark'
  end

  run! if app_file == $PROGRAM_NAME
end
