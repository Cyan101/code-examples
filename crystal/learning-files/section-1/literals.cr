this_is_nil = nil
yes = true
no = false

1_i8  # Int8 | -128 to 127
1_i16 # Int16 | -32,768 to 32,767
1_i32 # Int32 | −2,147,483,648 to 2,147,483,647
1_i64 # Int64 | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
# If no suffix is present, the literal's type is the lowest between Int32, Int64 and UInt64 in which the number fits
1_u8  # UInt8 | 0 to 255
1_u16 # UInt16 | 0 to 65,535
1_u32 # UInt32 | 0 to 4,294,967,295
1_u64 # UInt64 | 0 to 18,446,744,073,709,551,615

0b1101 # Binary starts with '0b' == 13
0xFE012D # Hexadecimal starts with '0x' == 16646445

1.0      # Float64
1.0_f32  # Float32
1_f32    # Float32
1e10     # Float64
1.5e10   # Float64
1.5e-7   # Float64
+1.3     # Float64
-0.5     # Float64

'a' # A singal Char
'z' # A singal Char
'0' # A singal Char
'_' # A singal Char
'\'' # single quote
'\\' # backslash
'\u0041' # == 'A' Unicode

:hello
:nice_meme
:"thats a nice meme"

[1, 2, 3]         # Array(Int32)
[1, "hello", 'x'] # Array(Int32 | String | Char)
[] of Int32 # same as Array(Int32).new
%w(one two three) # ["one", "two", "three"]
%i(one two three) # [:one, :two, :three]

{1 => 2, 3 => 4}     # Hash(Int32, Int32)
{1 => 2, 'a' => 3}   # Hash(Int32 | Char, Int32)
myhash = { 1 => 'a' }
myhash[1] # == 'a'

1..3 # 1 to 3 including 3
1...3 # 1 to 3 excluding 3

foo_or_bar = /foo|bar/ # PCRE type Regex
heeello    = /h(e+)llo/ # PCRE type Regex
integer    = /\d+/ # PCRE type Regex

# A tuple is a fixed-size, immutable, stack-allocated sequence of values of possibly different types
# It is like an immutable Array whose types for each position are known at compile time.
tuple = {1, "hello", 'x'} # Tuple(Int32, String, Char)
Tuple(Int32, String, Char)

# A Proc represents a function pointer with an optional context (the closure data).
# The types of the arguments are mandatory, except when directly sending a proc literal to a lib 'fun' in C bindings
->{ 1 } # Proc(Int32) | A proc without arguments
->(x : Int32) { x.to_s } # Proc(Int32, String) | A proc with one argument
->(x : Int32, y : Int32) { x + y } # Proc(Int32, Int32, Int32) | A proc with two arguments
Proc(Int32, String).new { |x| x.to_s } # Proc(Int32, String) | This allows you to specify the return type and to check it against the proc's body.

# To use a proc you must use the 'call' method on it
proc = ->(x : Int32, y : Int32) { x + y }
proc.call(1, 2) #=> 3
# Procs can be made from methods
def one
  1
end
proc = ->one
proc.call #=> 1
#If the method has arguments, you must specify their types:
def plus_one(x)
  x + 1
end
proc = ->plus_one(Int32)
proc.call(41) #=> 42