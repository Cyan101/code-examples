# frozen_string_literal: true
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sequel'
require 'sqlite3'
require 'bcrypt'

set :port, 8080
set :static, true
# set :public_folder, 'static'
set :views, 'views'
# set :session_secret, 'fsagd6asgd793hd287bx79h2db'
enable :sessions
#----------------------------
module Database
  DB = Sequel.connect('sqlite://users.db')

  class Users < Sequel::Model
  end
end

get '/db/?' do
  Database::Users.map do |x|
    "#{x[:id]}-#{x[:username]}=#{x[:password]}\n\n</br>"
  end
end

get '/home/?' do
  protected!
  return "User ID #{session[:id]}"
end

get '/pics/?' do
  haml :pics, format: :html5
end

# get '/images/:file' do
#  send_file('./public/images/' + params[:file])
# end

get '/avatars/:file' do
  send_file('./public/avatars/' + params[:file])
end

get '/counter/' do
  session['counter'] ||= 0
  session['counter'] += 1
  "You've hit this page #{session['counter']} times!"
end

get '/' do
  return 'Hello world'
end

get '/hello/?' do
  greeting = params[:greeting] || 'Hi There'
  haml :index, format: :html5, locals: { 'greeting' => greeting, 'title' => 'Nyaa~' }
end

get '/howdy/?' do
  erb :howdy
end

not_found do
  status 404
  '<h2>shit erm... we seem to have lost that page....</h2>'
end

get '/upload/?' do
  haml :upload, format: :html5
end

post '/upload' do
  protected!
  filetype = File.extname(params['myfile'][:filename])
  allowed = %w(.png .jpg .jpeg .gif .bmp .tiff)
  if allowed.include?(filetype.downcase)
    File.open('./public/avatars/' + session[:id].to_s + filetype, 'w') do |f|
      f.write(params['myfile'][:tempfile].read)
    end
    @user = Database::Users.find(id: session[:id])
    @user.update(pic: 'avatars/' + session[:id].to_s + filetype)
    redirect '/profile'
  end
  return haml :upload, format: :html5, locals: { 'error' => 'Invalid filetype or a different error occured' }
end

get '/profile/?' do
  protected!
  haml :profile
end

#------------------------------------------------
get '/signup/?' do
  haml :signup, format: :html5
end

post '/signup' do
  hashed_password = BCrypt::Password.create(params['password'])
  if Database::Users.find(username: params[:username])
    return haml :signup, format: :html5, locals: { 'error' => 'Username already taken' }
  end
  Database::Users.create(username: params['username'], password: hashed_password, pic: 'avatars/default.png')
  redirect '/home' if login(params['username'], params['password'])
  return haml :signup, format: :html5, locals: { 'error' => 'Unknown Error' }
end

get '/login/?' do
  haml :login, format: :html5
end

post '/login' do
  redirect '/home' if login(params['username'], params['password'])
  return haml :login, format: :html5, locals: { 'error' => 'Incorrect Username or Password' }
end

#--------------------------------------------------------
helpers do
  def login(username, password)
    @user = Database::Users.find(username: username)
    if @user
      unhashed_password = BCrypt::Password.new(@user.password)
      if unhashed_password == password
        session[:id] = @user.id
        session[:name] = @user.username
        session[:pic] = @user.pic
        return true
      else
        return false
      end
    end
  end

  def protected!
    return if authorized?
    halt haml :login, format: :html5, locals: { 'error' => 'Please login to view this page' }
  end

  def authorized?
    return true if session[:id]&.between?(1, 100)
    false
  end
end
