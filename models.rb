class User < ActiveRecord::Base
	has_many :posts
	has_many :ratings
	has_many :user_restaurants
	has_many :restaurant, through: :user_restaurants
end

class Restaurant < ActiveRecord::Base
	has_many :ratings
	has_many :posts
	has_many :user_restaurants
	has_many :users, through: :user_restaurants
end

class Post < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
end

class UserRestaurant < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
end

class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
end
