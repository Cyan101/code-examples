require 'sinatra'
require 'sequel'
require 'sqlite3'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
set :session_secret, 'fsagd6asgd793hd287bx79h2db'
enable :sessions

get '/' do
  erb :home
end

get '/registrations/signup' do
    erb :'/registrations/signup'
end

post '/registrations' do
  puts params
  @user = User.new(name: params["username"], password: params["password"])
  @user.save
  session[:id] = @user.id
  redirect '/users/home'
end

get '/users/home' do
  @user = User.find(session[:id])
  erb :'/users/home'
end

get '/sessions/logout' do
  session.clear
end