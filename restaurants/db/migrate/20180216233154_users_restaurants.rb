class UsersRestaurants < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_restaurants do |t| 
	  	t.references :restaurant
	  	t.references :user
	  	t.boolean :favorited
  	end 
  end
end
