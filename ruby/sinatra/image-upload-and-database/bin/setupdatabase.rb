require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://users.db')

DB.create_table? :users do
  primary_key :id
  String :username
  String :password
  String :pic 
end

users = DB[:users]

users.insert(:username => 'abc', :password => 123)
users.insert(:username => 'def', :password => 222)
users.insert(:username => 'ghi', :password => 333)