require 'sinatra'
require 'sinatra/activerecord'
require './models'

enable :sessions
set :database, "sqlite3:store.sqlite3"

def current_user
	if session[:user_id] #if the user is signed in set the instance variable with the current user
		User.find(session[:user_id])
	end
end

def user_signed_in?
	!session[:user_id].nil?
end

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
	@body_class = 'signinbackground'
	erb :sign_in
end

get '/sign_up' do
	@body_class = 'signupbackground'
	erb :sign_up
end

# get '/user_profile' do
# 	erb :user_profile
# end

post '/sign_in' do
	email = params[:user][:email]
	password = params[:user][:password]
	@user = User.where(email: email).first
	if @user && @user.password == password
		session[:user_id] = @user.id #signs in the user.
		redirect "/user_profile/#{@user.id}"
	else
		redirect "/sign_in"
	end
end

get '/sign-out' do
	session[:user_id] = nil
	redirect '/'
end

get '/update_profile' do
	@user = current_user
	erb :update_profile
end

post '/update_profile' do
	@user = current_user
	updates = {}
	params[:user].each do |col,val|
		if !val.blank?
			updates[col.to_sym] = val
		else
			
		end
	end
	current_user.update_attributes(updates)
	redirect "/user_profile/#{@user.id}"
end

get '/user_profile/:id' do
	@user = User.find(params[:id])
	erb :user_profile
end

post '/new_user' do
	@user = User.create(params[:user])
	session[:user_id] = @user.id #signs in the user.
	redirect "/user_profile/#{@user.id}"
end