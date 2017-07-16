#Outputs 1 to 10 when called
def puts_1_to_10
  (1..10).each { |i| puts i }
end

puts_1_to_10

#Splat "*" tell's it we don't know how many arguments there will be
def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end

what_up("What up", "Justin", "Ben", "Kevin Sorbo")

#Return can return something
def add(x,y)
  return x+y
end

#
def greeter(name)
    puts "Hello " + name
end

def by_three?(x)
    if x % 3 == 0
        return true
    else
        return false
    end
end
