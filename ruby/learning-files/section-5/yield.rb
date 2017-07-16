def double(n)
    puts n
    yield n*2
end

double(5) { |n| puts n }
