class Movie < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :oscar_categories, through: :movie_oscar_categories
  has_many :movie_theaters
  has_many :theaters, through: :movie_theaters

  enum status: { 0 => 'Not Seen', 1 => 'Seen' }

  def self.get_times_and_theaters(_name, _zipcode)
    # binding.pry
    # url = "https://www.google.com/#q=" + name.split.join("+") + "+" + zipcode.to_s
    # binding.pry
    # html_data = open(url).read
    # nokogiri_object = Nokogiri::HTML(html_data)
    # binding.pry
  end

  def update_status
    self.status = status == 0 ? 'Seen' : 'Not Seen'
    save!
  end

  def self.filter_by_category(params)
    if params['name'].nil? || params['name']['category'] == 'All'
      Movie.all.includes(:oscar_categories, :theaters).order(:title)
    else
      category = params['name']['category']
      OscarCategory.where(name: category).includes(:movies)[0].movies
    end
  end
end
