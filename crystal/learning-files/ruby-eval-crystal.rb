puts 'To run with Crystal:'
input = gets.chomp
code = "crystal eval '#{input}'"
puts '----------'
system(code)