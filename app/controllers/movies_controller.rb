class MoviesController < ApplicationController
  def show
    movie_id = params['id'].to_i
    @movie = Movie.includes(:oscar_categories, :theaters).find(movie_id)
  end

  def update
    movie_id = params['movie_id'].to_i
    movie = Movie.find(movie_id)
    movie.update_status

    redirect_to movies_path
  end

  def index
    @movies = Movie.filter_by_category(params)
    @seen_movies = @movies.select { |movie| movie.status == 0 }
    @unseen_movies = @movies.select { |movie| movie.status == 1 }
  end
 end
