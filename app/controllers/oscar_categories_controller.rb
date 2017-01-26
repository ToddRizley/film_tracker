class OscarCategoriesController < ApplicationController

    def edit
      @oscar_categories = OscarCategory.where.not(name: "All").order(:name).collect(&:name)
      # redirect_to :action => 'oscar_categories#update'
    end

   def add_movies_to_categories
     binding.pry
     category_id = params['id'].to_i
     binding.pry
     category = OscarCategory.includes(:movies).find(category_id)
     binding.pry
     movies = params["movies"]
     binding.pry
     movie_titles = Movie.all.pluck(:title)
     binding.pry
     movies.each do |movie_title|
       if movie_titles.include(movie_title)
         movie =  Movie.where(title: movie_title)
       else
         movie = Movie.create(title: movie_title, status: 'Not Seen', oscar_year: 2017)
      end
      category.movies << movie
      category.save!
    end

    binding.pry
     redirect_to movies_path
   end


 end
