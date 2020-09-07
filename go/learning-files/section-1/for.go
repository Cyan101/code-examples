package main

import "fmt"

func main() {

  //Simple loop
  i := 1
  for i <= 3 {
      fmt.Println(i)
      i = i + 1
  }

  //Similiar loop but shorthand
  for j := 7; j <= 9; j++ {
    fmt.Println(j)
  }

  //Another loop, checks if remainder of n/2 is 0 aka even or odd
  for n := 0; n <= 5; n++ {
    if n%2 == 0 {
      continue //Continue goes to the next loop iteration
    }
    fmt.Println(n)
  }

}
