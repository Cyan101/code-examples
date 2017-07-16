require 'mail'

mail = Mail.new

puts "Please allow less-secure logins here -> https://myaccount.google.com/lesssecureapps"
puts "Google Username: (no @gmail)"
username = gets.chomp
email_address = username + "@gmail.com"
puts "Google Password:"
password = gets.chomp

mail.delivery_method(
  :smtp,
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: user_name,
  password: password,
  authentication: 'plain',
  enable_starttls_auto: true
)

puts "To:"
to_address = gets.chomp
puts "Subject:"
subj = gets.chomp
puts "Message (Accepts HTML):"
subj = gets.chomp

from email_address
to to_address
subject subj
html_part do
  content_type 'text/html; charset=UTF-8'
  body "<div style='font-family: monospace;'>" + bod + "</div>"
end

mail.deliver!
