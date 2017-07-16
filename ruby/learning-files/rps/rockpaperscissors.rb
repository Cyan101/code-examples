puts 'Please enter rock, paper or scissors'
input = gets.chomp.downcase
npcinput = %w(rock paper scissors).sample
case input
when 'rock'
  puts 'you win!' if npcinput == 'scissors'
  puts 'you lose!' if npcinput == 'paper'
  puts 'tie!' if npcinput == 'rock'
when 'paper'
  puts 'you lose!' if npcinput == 'scissors'
  puts 'tie!' if npcinput == 'paper'
  puts 'you win!' if npcinput == 'rock'
when 'scissors'
  puts 'tie!' if npcinput == 'scissors'
  puts 'you win!' if npcinput == 'paper'
  puts 'you lose!' if npcinput == 'rock'
else
  puts 'Invalid input'
end

#puts 'Please enter rock, paper or scissors'
#input = gets.chomp.downcase
#rand(1..3)
#puts "win" if rand == 1
#puts "lose" if rand == 2
#else puts "draw"