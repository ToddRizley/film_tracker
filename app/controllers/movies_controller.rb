class MoviesController < ApplicationController

  # def create
  # end
  def show
  end

  def update
    movie_id = params["movie_id"].to_i
    movie = Movie.find(movie_id)
    movie.update_status
    binding.pry
    redirect_to movies_path
  end


  def index
    @movies = Movie.all.includes(:oscar_categories, :theaters).order(:title)

    # render @movies
  end

end
