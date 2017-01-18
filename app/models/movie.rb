class Movie < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :oscar_categories, through: :movie_oscar_categories
  has_many :movie_theaters
  has_many :theaters, through: :movie_theaters
end
