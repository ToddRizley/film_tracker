class MoviesController < ApplicationController

  def show
  end

  def index
    @movies = Movie.all.includes(:oscar_categories, :theaters)

    render movies_path
  end

end
