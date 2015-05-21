class AddProductCategtories < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :name, limit: 100, null: false
  		t.string :slug, limit: 100, null: false
  		t.text :description
  		t.timestamps null:false
  	end

  	create_join_table :products, :categories do |t|
  		t.index :product_id
  		t.index :category_id
  	end
  end
end
