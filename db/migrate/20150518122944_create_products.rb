class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false
      t.text :description, null: false
      t.decimal :price, precision: 6, scale:2, null: false

      t.timestamps null: false
    end

    add_index :products, :name, unique: true
  end
end
