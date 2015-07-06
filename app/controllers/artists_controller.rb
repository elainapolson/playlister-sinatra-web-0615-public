class ArtistsController < ApplicationController
  
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index.html'
  end

  get 'artists/new' do 
  end

  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show.html'
  end 

  get 'artists/:slug/edit' do 
    @artist = Artist.find_by_slug(params[:slug])
  end

  post '/artists' do
  end

  patch '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
  end

  delete '/artists' do 
  end

end