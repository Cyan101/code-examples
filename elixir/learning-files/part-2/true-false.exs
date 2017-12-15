false and raise("This error will never be raised")
#=>false
true or raise("This error will never be raised")
#=>true

# `or` and `and` are short-circuit operators. They only execute the right side if the left side is not enough to determine the result
# `not` is also a boolean operator

# Besides these boolean operators, Elixir also provides ||, && and ! which accept arguments of any type.
# For these operators, all values except false and nil will evaluate to true -

# or
1 || true
#=>1
false || 11
#=>11

# and
nil && 13
#=>nil
true && 17
#=>17

# !
!true
#=>false
!1
#=>false
!nil
#=>true
