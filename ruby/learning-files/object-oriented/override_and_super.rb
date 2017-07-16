class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!

class Dragon < Creature
    def fight #overrides the Creature method
        puts "Instead of breathing fire!"
        super #Goes to the Creatures fight, don't forget to include args if needed
    end
end
