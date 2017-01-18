class OscarCategory < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :movies, through: :movie_oscar_categories
end
