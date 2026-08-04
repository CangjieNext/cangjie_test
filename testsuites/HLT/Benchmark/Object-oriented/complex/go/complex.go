/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
  "fmt"
  "os"
  "strconv"
  "time"
)

var shouldLog = false
var blackHole = 0

func main() {
  args := os.Args
  if (len(args) != 4) {
      fmt.Println("Usage: program <iterations> <repeats> <mode>")
      fmt.Println("   where mode == 0 means use ComplexObject")
      fmt.Println("   where mode == 1 means use ComplexStruct")
      return
  }

  var N, err1 = strconv.Atoi(args[1])
  if err1 != nil {
      return
  }

  var R, err2 = strconv.Atoi(args[2])
  if err2 != nil {
      return
  }

  var mode, err3 = strconv.Atoi(args[3])
  if err3 != nil {
      return
  }

  shouldLog = true  
  for i := 0; i < R; i++ {
      if (mode == 0) {
        measureObject(N)
      } else if (mode == 1) {
        measureStruct(N)
      } else {
        fmt.Printf("Unexpected mode: %d\n", mode)
        return 
      }

  }
}

func measureObject(N int) {
  var start = time.Now()
  blackHole = measureBodyObject(N)

  if (shouldLog) {
    var timeMs = time.Since(start).Milliseconds()
    fmt.Printf("ComplexObject with %d problem size took %d ms. Computation result: %d\n", N, timeMs, blackHole)
  }
}

func measureBodyObject(N int) int {
    var a * ComplexObject
    var sum = 0
    for i := 0; i < N; i++ {
        for j := 0; j < N; j++ {
            if ( (i + j) > (N /2) ) {
               a = createComplexObject(i, j)               
            } else {
               a = createComplexObject(j, i)               
            }

            sum += modulusObject(a)
        }
    }
    return sum
}

func createComplexObject(r int, i int) * ComplexObject {
  return &ComplexObject{int64(r), int64(i)}
}

func modulusObject(c * ComplexObject) int {
  return int(c.re * c.re + c.im * c.im)
}

type ComplexObject struct {
    re int64
    im int64
}

func measureStruct(N int) {
  var start = time.Now()
  blackHole = measureBodyStruct(N)

  if (shouldLog) {
    var timeMs = time.Since(start).Milliseconds()
    fmt.Printf("ComplexStruct with %d problem size took %d ms. Computation result: %d\n", N, timeMs, blackHole)
  }
}

func measureBodyStruct(N int) int {
    var a ComplexStruct
    var sum = 0
    for i := 0; i < N; i++ {
        for j := 0; j < N; j++ {
            if ( (i + j) > (N /2) ) {
               a = createComplexStruct(i, j)
            } else {
               a = createComplexStruct(j, i)
            }

            sum += modulusStruct(a)
        }
    }
    return sum
}

func createComplexStruct(r int, i int) ComplexStruct {
  return ComplexStruct{int64(r), int64(i)}
}

func modulusStruct(c ComplexStruct) int {
  return int(c.re * c.re + c.im * c.im)
}

type ComplexStruct struct {
    re int64
    im int64
}
