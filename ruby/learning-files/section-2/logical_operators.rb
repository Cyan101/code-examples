num = 5
num2 = 10

if num == 5 && num2 == 10
  puts "2 in 1!"
end

if num == 1 || num2 == 10
  puts "Or... how about this"
end

if num == 5 && !(num2 == 10) #bracket so it runs on the result not the num2
  puts "this wont output"
end

=begin
"&&" means and, "||" means or, "!" means not
"!" is a tricky one to get at first, it stands for "not" which means if its true its now false and vice-versa

thing = false
!thing turns it into true

thing = true
!thing turns it into false

thing = 51232
!thing turns it into false

thing = "literally anything except false"
!thing turns it into false

thing = nil
!thing turns it into true
=end
