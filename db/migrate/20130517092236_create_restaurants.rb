class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :food_type
      t.string :photo_url
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
