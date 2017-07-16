floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new { |x| x.floor }
ints = floats.collect(&round_down)



group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

over_4_feet = Proc.new { |height| height >= 4 }

group_1.select(&over_4_feet)
group_2.select(&over_4_feet)
group_3.select(&over_4_feet)




def greeter
    yield
end
phrase = Proc.new { puts "Hello there!" }
greeter(&phrase)


ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new { |x| x < 100 }
youngsters = ages.select(&under_100)
