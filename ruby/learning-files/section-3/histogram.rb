puts "Input please"
text = gets.chomp

words = text.split(" ")

frequencies = Hash.new(0)

words.each do |x|
frequencies[x] += 1
puts frequencies[x]
end

frequencies = frequencies.sort_by do |x, y|
    y
end

frequencies.reverse!

frequencies.each do |word, amount|
    puts "#{word} #{amount}"
end
