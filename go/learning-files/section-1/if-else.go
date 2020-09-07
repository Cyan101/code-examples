package main

import "fmt"

func main() {

  //Unlike Ruby, Can't read strings of numbers as numbers
  //if "1" == 1 {
    //fmt.Println("Strings can be read as numbers")
  //}

  if 7%2 == 0 {
    fmt.Println("7 is even")
  } else {
    fmt.Println("7 is odd")
  }

  if 8%4 == 0 {
    fmt.Println("8 is divisible by 4")
  }

  //No ternary in Go, so must do if -> else
  if num := 9; num < 0 { //num is declared and available inside the branches ONLY
    fmt.Println(num, "is negative")
  } else if num < 10 {
    fmt.Println(num, "has 1 digit")
  } else {
    fmt.Println(num, "has multiple digits")
  }

}
