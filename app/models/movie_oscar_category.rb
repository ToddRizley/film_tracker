class MovieOscarCategory < ApplicationRecord
  belongs_to :movie
  belongs_to :oscar_category
end
