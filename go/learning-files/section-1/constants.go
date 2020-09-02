package main

import ("fmt"; "math") //Can use ';' instead of newlines for #import

const s string = "constant"

func main() {
  fmt.Println(s)

  //Can't do 500,000,000
  const n = 500000000

  const d = 3e20 / n
  fmt.Println(d) //Prints 6e+11

  fmt.Println(int64(d)) //Prints 6000000000 as you gave it a type, until you do it has none

  fmt.Println(math.Sin(n)) //Prints as a "readable" number because math.Sin expects a float64 and outputs the same
}
