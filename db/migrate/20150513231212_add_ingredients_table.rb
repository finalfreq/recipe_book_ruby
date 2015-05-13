class AddIngredientsTable < ActiveRecord::Migration
  def change
    create_table(:instructions) do |t|
      t.column :description, :string
      t.integer :recipe_id
    end
  end
end
