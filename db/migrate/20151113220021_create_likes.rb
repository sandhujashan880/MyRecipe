class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :likes
      t.integer :chef_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end
