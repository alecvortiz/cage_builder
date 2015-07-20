class AddTagToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :tag, :integer
  end
end
