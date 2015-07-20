class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :dob
      t.string :gender
      t.string :genotype
      t.integer :cage_id

      t.timestamps null: false
    end
  end
end
