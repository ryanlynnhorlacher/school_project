class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.integer :rating, null: false, min: 1, max: 10
      t.string :level, null: false

      t.timestamps
    end
  end
end
