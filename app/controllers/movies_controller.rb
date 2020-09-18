class MovieController < ApplicationController
  get "/movies" do
    @movies = Movie.all
    erb :'movies/index'
  end

  get "/movies/new" do
    erb :'movies/new'
  end

  get "/movies/:slug" do
    @movie = Movie.find_by_slug(params[:slug])
    erb :'movies/show'
  end

  post "/movies" do
    @movie = Movie.create(params)
    redirect "/movies/#{@movie.slug}"
  end

  get "/movies/:slug/edit" do
    @movie = Movie.find_by_slug(params[:slug])
    erb :'movies/edit'
  end

  patch "/movies/:slug" do
    movie = Movie.find_by_slug(params[:slug])
    movie.update(params[:name])
    redirect "/movies/#{customer.slug}"
  end
end
