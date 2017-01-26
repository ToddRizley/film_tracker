class OscarCategoriesController < ApplicationController
  def edit
    @oscar_categories = OscarCategory.where.not(name: 'All').order(:name).collect(&:name)
  end

  def update
    category = params['name']['category']
    movies = params['movies_to_add'].values.select { |movie| movie != ""}
    category = OscarCategory.includes(:movies).find_by(name: category)
    category.add_movies_to_category(movies)
    binding.pry

    redirect_to movies_path
  end
 end
