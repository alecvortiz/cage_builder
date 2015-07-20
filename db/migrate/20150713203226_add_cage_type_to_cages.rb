class AddCageTypeToCages < ActiveRecord::Migration
  def change
    add_column :cages, :cage_type, :string
  end
end
