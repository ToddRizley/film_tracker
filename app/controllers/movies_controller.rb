class MoviesController < ApplicationController
  def show
  end

  def update
    movie_id = params['movie_id'].to_i
    movie = Movie.find(movie_id)
    movie.update_status

    redirect_to movies_path
  end

  def index
    @movies = Movie.all.includes(:oscar_categories, :theaters).order(:title)
  end
end
