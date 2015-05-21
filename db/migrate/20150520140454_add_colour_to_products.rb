class AddColourToProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
  		t.string :colour, limit: 30
  	end
  end
end
