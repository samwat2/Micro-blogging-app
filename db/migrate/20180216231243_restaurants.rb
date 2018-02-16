class Restaurants < ActiveRecord::Migration[5.1]
  def change
  	create_table :restaurants do |t|
  		t.string :name
  		t.string :img_url
  		t.string :description
  	end
  end
end
