class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age
      t.date :birth_date
      t.string :color, null: false
      t.string :name
      t.string :sex, limit: 1

      t.timestamps
    end
  end
end
