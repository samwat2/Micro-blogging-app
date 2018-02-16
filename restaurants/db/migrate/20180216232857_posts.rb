class Posts < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.string :content
  		t.datetime :creation_date
  		t.references :restaurant
  		t.references :user
  	end
  end
end
