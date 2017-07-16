require 'date'

class Numeric
  Alpha52 = ("a".."z").to_a + ("A".."Z").to_a
  def to_s52
    return "" if self < 1
    s, q = "", self
    loop do
      q, r = (q - 1).divmod(52)
      s.prepend(Alpha52[r]) 
      break if q.zero?
    end
    s
  end
end

puts 345678.to_s52
puts DateTime.now.strftime('%Q').to_i.to_s52
