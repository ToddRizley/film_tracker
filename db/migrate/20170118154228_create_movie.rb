class CreateMovie < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :status
      t.integer :oscar_year
    end
  end
end
