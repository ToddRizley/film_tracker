class Movie < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :oscar_categories, through: :movie_oscar_categories
  has_many :movie_theaters
  has_many :theaters, through: :movie_theaters

  enum status: { 'Not Seen' => 0, 'Seen' => 1 }

  def self.get_times_and_theaters(name, zipcode)
    # binding.pry
    # url = "https://www.google.com/#q=" + name.split.join("+") + "+" + zipcode.to_s
    # binding.pry
    # html_data = open(url).read
    # nokogiri_object = Nokogiri::HTML(html_data)
    # binding.pry
  end
end
