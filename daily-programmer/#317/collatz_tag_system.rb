#[2017-05-29] Challenge #317 [Easy] Collatz Tag System
#https://www.reddit.com/r/dailyprogrammer/comments/6e08v6/20170529_challenge_317_easy_collatz_tag_system/

def collatz(tag)
  tag_keys = %w(a b c)
  tag_system = %w(bc a aaa)

  while tag.length > 1
    case tag.chr
      when tag_keys[0]
        tag = tag[2..-1] + tag_system[0]
      when tag_keys[1]
        tag = tag[2..-1] + tag_system[1]
      when tag_keys[2]
        tag = tag[2..-1] + tag_system[2]
      end
    puts tag
  end
  
  puts '~Done~'
end

collatz('aaa')
