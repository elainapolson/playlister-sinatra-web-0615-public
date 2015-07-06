class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index.html'
  end

  get '/songs/new' do 
    @genres = Genre.all
    erb :'songs/new.html'
  end
  
  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit.html'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:songs])
    song.save
    session[:success_message] = "Song successfully updated."
    redirect to "/songs/#{song.slug}"
  end

  post '/songs' do
    song = Song.new(params[:songs])
    song.save
    session[:success_message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @success_message = session[:success_message]
    session[:success_message] = nil
    erb :'songs/show.html'
  end

  delete '/songs/:slug/delete' do 
    song = Song.find_by_slug(params[:slug])
    song.delete
    redirect to '/songs'
  end

end