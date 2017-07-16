#You create an instance of a class by invoking new on that class
john = Person.new "John"
peter = Person.new "Peter"

john.name #=> "John"
john.age #=> 0

peter.name #=> "Peter"


#Making the class
class Person
  def initialize(name : String) # since name isn't set for the class, we must tell it that it wil be a string
    @name = name
    @age = 0 #here we assign a literal value, so it knows its an Int
  end

  def name
    @name
  end

  def age
    @age
  end
end