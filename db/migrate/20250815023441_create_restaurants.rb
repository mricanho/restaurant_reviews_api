class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.decimal :avg_rating, precision: 3, scale: 2, default: 0

      t.timestamps
    end
  end
end
