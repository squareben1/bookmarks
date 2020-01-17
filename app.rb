# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  
  enable :sessions#, :method_override 

  get '/' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add_bookmark' do
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end
  #get rid of params

  get '/bookmarks' do #needs confirmation of ADD
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark'
  end

  get '/delete_bookmark' do 
    erb :'bookmarks/delete_bookmark'
  end 

  post '/delete_bookmark' do #need to go over walkthrough
    Bookmark.delete(delete_target: params[:delete_title])
    p "------params #{params}"
    redirect "/deleted_confirm?deleted_record=#{params[:delete_title]}" #query string
  end 

  get '/deleted_confirm' do 
    @deleted_record = params[:deleted_record]
    erb :'bookmarks/deleted_confirm'
  end 

  run! if app_file == $PROGRAM_NAME
end
