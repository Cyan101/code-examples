i = 20
loop do
  i -= 1
  print "#{i},"
  break if i <= 0
end

#loop, runs the code until we hit the break

i = 20
loop do
  i -= 1
  next if i % 2 == 1
  print "#{i}"
  break if i <= 0
end

#"next" only runs the next line if the "if" triggers

array = [1,2,3,4,5]

array.each do |x|
  x += 10
  print "#{x}"
end

#|x| is a placeholder for the array data we work on

10.times { print "Ruby + Pizza = Life" }

#Pretty self explanatory

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
s.each do |sub_array|
    sub_array.each do |y|
        puts y
    end
end
#how to output all of a nested array
