def alphabetize(arr, rev=false)
  if rev
    arr.sort { |x, y| x <=> y }
  else
    arr.sort { |x, y| x <=> y }
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}"
puts "Z-A: #{alphabetize(books, true)}"
