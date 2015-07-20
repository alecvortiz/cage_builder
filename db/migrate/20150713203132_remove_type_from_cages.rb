class RemoveTypeFromCages < ActiveRecord::Migration
  def change
    remove_column :cages, :type, :string
  end
end
