# Defines a method in the program
def add(x, y)
  x + y
end

# Invokes the add method in the program
add(1, 2) #=> 3


def even?(num)
  if num % 2 == 0
    return true
  end

  return false
end




#If you want to invoke the program's method, even though the current type defines a method with the same name, prefix the call with ::
def baz(x, y)
  x + y
end

class Foo
  def bar
    baz(4, 2) #=> 2
    ::baz(4, 2) #=> 6
  end

  def baz(x, y)
    x - y
  end
end