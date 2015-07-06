class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index.html'
  end

  get 'genres/new' do 
  end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show.html'
  end 

  get 'genres/:slug/edit' do 
    @genre = Genre.find_by_slug(params[:slug])
  end

  post '/genres' do
  end

  patch '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
  end

  delete '/genres' do 
  end

end