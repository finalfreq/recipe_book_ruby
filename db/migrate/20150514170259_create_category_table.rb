class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.string :name
    end
    create_table(:categories_recipes) do |t|
      t.integer :category_id
      t.integer :recipe_id
    end
    add_index :categories_recipes, :category_id
    add_index :categories_recipes, :recipe_id
  end
end
