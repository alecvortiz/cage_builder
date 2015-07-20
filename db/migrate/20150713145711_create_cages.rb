class CreateCages < ActiveRecord::Migration
  def change
    create_table :cages do |t|
      t.integer :num_mice
      t.string :line
      t.integer :num_litters
      t.boolean :pups
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
