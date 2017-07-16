#Proc vs Lambda
def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victaor.call
  "Iron Man will win!"
end
puts batman_ironman_proc
#so this will output "Batman will wins!"

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end
puts batman_ironman_lambda
#this will return "Iron Man will win"
#because a lambda still goes back even after the return, while a proc immediatly exits


strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)


my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda { |x| x.is_a? Symbol }
symbols = my_array.select(&symbol_filter)
