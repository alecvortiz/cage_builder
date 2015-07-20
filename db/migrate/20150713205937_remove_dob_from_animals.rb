class RemoveDobFromAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :dob, :integer
  end
  def change
    add_column :animals, :birthday, :date
  end
end
