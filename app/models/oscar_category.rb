class OscarCategory < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :movies, through: :movie_oscar_categories

  def add_movies_to_category(movies)
    movie_titles = Movie.all.pluck(:title)
    movies.each do |movie_title|
      movie = Movie.where(title: movie_title) if movie_titles.include?(movie_title)
      movie = Movie.create(title: movie_title, status: 'Not Seen', oscar_year: 2017) unless movie_titles.include?(movie_title)
      self.movies << movie
      save!
    end
  end
end
