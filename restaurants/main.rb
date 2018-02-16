require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :home
end

get '/about' do
	erb :about
end 

get '/restaurant_profile' do
	erb :restaurant_profile
end

get '/restaurants' do
	erb :restaurants
end

get '/sign_in' do
	erb :sign_in
end

get '/sign_up' do
	erb :sign_up
end

get '/user_profile' do
	erb :user_profile
end