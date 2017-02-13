class Movie < ApplicationRecord
  has_many :movie_oscar_categories
  has_many :oscar_categories, through: :movie_oscar_categories
  has_many :movie_theaters
  has_many :theaters, through: :movie_theaters

  validates :title, presence: true
  validates :status, presence: true
  validates :oscar_year, presence: true
  validates :title, uniqueness: true

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

  def self.get_nominees
    ## this method needs some love
    url = 'http://www.thewrap.com/oscar-nominations-2017-complete-list/'
    doc = Nokogiri::HTML(open(url))
    slice = doc.css('p')[11..66]
    (0..slice.length - 1).step(2).each do |index|
      name = slice[index].text.split('Best')
      name = name[1].strip if name.length > 1
      movies = slice[index + 1].text.split(/\r?\n/)
      movies = movies.map { |line| line.gsub(/[[:punct:]]/, '.').split('.')[3] }
      cat = OscarCategory.create(name: name) unless OscarCategory.find_by(name: name)
      cat.add_movies_to_category(movies) if cat
    end
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
