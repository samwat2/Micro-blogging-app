class Ratings < ActiveRecord::Migration[5.1]
  def change
  	create_table :ratings do |t|
  		t.references :restaurant
  		t.references :user
  		t.integer :rating
  	end
  end
end
