class AddPictureToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :picture, :string
    add_column :recipes, :string, :string
  end
end
