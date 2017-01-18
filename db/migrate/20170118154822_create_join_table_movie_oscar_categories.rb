class CreateJoinTableMovieOscarCategories < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movie, :oscar_categories do |t|
      t.index [:movie_id, :oscar_category_id]
      t.index [:oscar_category_id, :movie_id]
    end
  end
end
