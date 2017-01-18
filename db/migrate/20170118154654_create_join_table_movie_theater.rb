class CreateJoinTableMovieTheater < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movie, :theaters do |t|
      t.index [:movie_id, :theater_id]
      t.index [:theater_id, :movie_id]
      t.integer :date_times, array: true, default: []
    end
  end
end
