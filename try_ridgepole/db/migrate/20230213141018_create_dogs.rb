class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :style
      t.string :color
      t.integer :age

      t.timestamps
    end

    add_index :dogs, :name
  end
end
