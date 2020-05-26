class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :chef
      t.string :ingredients
      t.integer :prep_time
      t.string :directions
      t.string :image_url

      t.timestamps
    end
  end
end
