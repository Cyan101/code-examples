package main

import "fmt"

func main(){
  var a = "initial"
  fmt.Println(a)

  //Declaring Multiple Variables
  var b, c int = 1, 2
  fmt.Println(b, c)

  var d = true
  fmt.Println(d)

  var e int
  fmt.Println(e)

  //Shorthand Variable declaration
  f := "apple"
  g, h := "banana", "orange"
  fmt.Println(f, g, h)
}
