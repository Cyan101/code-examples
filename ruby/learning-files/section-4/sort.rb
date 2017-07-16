book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

book_1 <=> book_2

#returns 0 if they are equal, 1 if book_1 is bigger than, -1 if book_1 is smaller than

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]
# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below
#books.reverse! also works
books.sort! { |firstBook, secondBook| secondBook <=> firstBook }

fruits = ["orange", "apple", "banana", "pear", "grapes"]
fruits.sort! do |orange, apple|
    apple <=> orange
end
