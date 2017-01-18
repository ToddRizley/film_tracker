class CreateOscarCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :oscar_categories do |t|
      t.string :name
    end
  end
end
