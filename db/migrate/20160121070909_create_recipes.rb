class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.text :need_ingredients
      t.text :steps
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :recipes, [:user_id, :name]
  end
end
