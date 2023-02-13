class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :style
      t.string :color
      t.integer :age

      t.timestamps
    end
    add_index :cats, :name
  end
end
