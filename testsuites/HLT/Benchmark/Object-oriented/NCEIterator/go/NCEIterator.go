/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
  "os"
  "strconv"
  "math/rand"
  "fmt"
  "time"
)

func getRandBool() bool {
  return rand.Intn(2) == 1
}

type ElementKind int

const (
  BEAN ElementKind = iota
  PROPERTY
  METHOD
)

var checkableCount uint64 = 0
var callCount uint64 = 0
var notCascading uint64 = 0
var nonCheckableMarkedCount uint64 = 0

type A interface {
}

type M_A interface {
  A
  getKind() ElementKind
  getKindVerified() ElementKind
  isCascading() bool
  isCascadingVerified() bool
  isConstrained() bool
  isConstrainedVerified() bool
}


type M_A_A struct {
  cascading bool
  constrained bool
}

func (t M_A_A) isCascading() bool {
  return t.cascading
}

func (t M_A_A) isCascadingVerified() bool {
  callCount++
  return t.cascading
}

func (t M_A_A) isConstrained() bool {
  return t.constrained
}

func (t M_A_A) isConstrainedVerified() bool {
  callCount++
  return t.constrained
}

func makeBaseMAA() M_A_A {
  cascading := getRandBool()
  constrained := getRandBool()
  if cascading && constrained {
      checkableCount++
  } else if !cascading {
      notCascading++
  }
  return M_A_A{cascading, constrained}
}

type M_A_A_A struct {
  M_A_A
}

func (t M_A_A_A) getKind() ElementKind {
  return BEAN
}

func (t M_A_A_A) getKindVerified() ElementKind {
  callCount++
  return BEAN
}

func makeMAAA() M_A_A_A {
  return M_A_A_A{makeBaseMAA()}
}

type M_A_A_B struct {
  M_A_A
  isKind ElementKind
}

func makeMAAB() M_A_A_B {
  return M_A_A_B{makeBaseMAA(), METHOD}
}

func (t M_A_A_B) getKind() ElementKind {
  return t.isKind
}

func (t M_A_A_B) getKindVerified() ElementKind {
  callCount++
  return t.isKind
}

type M_A_A_C struct {
  M_A_A
}

func makeMAAC() M_A_A_C {
  return M_A_A_C{makeBaseMAA()}
}

func (t M_A_A_C) getKind() ElementKind {
  return PROPERTY
}

func (t M_A_A_C) getKindVerified() ElementKind {
  callCount++
  return PROPERTY
}

// Not strictly equivalent to abstract classes used in other implementations,
// but only interfaces and exact concrete types can be used in type checks in Go.
// We definitely don't want the latter, since the whole point of additional subtypes
// is the indirect call itself.
type N interface {
  isMarked() bool
  isMarkedVerified() bool
}

type N_A_A struct {
  N
  M_A
  marker bool
  cascading bool
  constrained bool
}

func (t N_A_A) isMarked() bool {
  return t.marker
}

func (t N_A_A) isMarkedVerified() bool {
  callCount++
  return t.marker
}

func (t N_A_A) isCascading() bool {
  return t.cascading
}

func (t N_A_A) isCascadingVerified() bool {
  callCount++
  return t.cascading
}

func (t N_A_A) isConstrained() bool {
  return t.constrained
}

func (t N_A_A) isConstrainedVerified() bool {
  callCount++
  return t.constrained
}

func makeBaseNAA() N_A_A {
  marker := getRandBool()
  cascading := getRandBool()
  constrained := getRandBool()
  if cascading && constrained {
      checkableCount++
  } else {
    if !cascading {
      notCascading++
    }
    if marker {
      nonCheckableMarkedCount++
    }
  }
  return N_A_A{marker: marker, cascading: cascading, constrained: constrained}
}

type N_A_A_A struct {
  N_A_A
}

func (t N_A_A_A) getKind() ElementKind {
  return BEAN
}

func (t N_A_A_A) getKindVerified() ElementKind {
  callCount++
  return BEAN
}

func makeNAAA() N_A_A_A {
  return N_A_A_A{makeBaseNAA()}
}

var items uint64 = 500
var iterations uint64 = 1000000
var result = false

func verify(iterations uint64, mAVec []M_A) uint64 {
  var expected uint64 = 0
  var cascadingMarkedCount uint64 = 0
  var nonCascadingMarkedCount uint64 = 0
  var nonCheckableNCount uint64 = 0

  if items != uint64(len(mAVec)) {
    panic("Wrong item count")
  }

  for i := uint64(0); i < iterations; i++ {
    var checkedCount uint64 = 0

    for j := uint64(0); j < items; j++ {
      var maElement = mAVec[j]
      if maElement.isCascadingVerified() && maElement.isConstrainedVerified() {
        kind1 := maElement.getKindVerified()
        result = (kind1 == PROPERTY && j % 2 == 0) || (kind1 == METHOD && j % 2 != 0 && j % 3 == 0) || (kind1 == BEAN && (j % 20 == 0 || j % 2 != 0 && j % 3 != 0))

        if !result {
          panic("Wrong kind")
        }

        checkedCount++

        kind2 := maElement.getKindVerified()
        result = (kind2 != PROPERTY || j % 2 != 0) && (kind2 != METHOD || j % 2 == 0 || j % 3 != 0) && (kind2 != BEAN || j % 20 != 0 && (j % 2 == 0 || j % 3 == 0))

        if result {
          panic("Wrong kind")
        }

        checkedCount++

        if j % 20 != 0 && j % 2 == 0 {
          expected = (expected << 1 | 1) % 9223372036854775783
        } else {
          expected = (expected << 1) % 9223372036854775783
        }
      } else {
        var increment uint64 = 0

        if n, ok := interface{}(maElement).(N); ok {
          nonCheckableNCount++
          if n.isMarkedVerified() {
            increment = 1
          }
        }

        if (increment != 0) && (increment != 1) {
          panic("Wrong increment")
        }

        // Assert that (increment == 1) => (j % 20 == 0)
        if (increment != 0) && (j % 20 != 0) {
          panic("Wrong element")
        }

        if maElement.isCascadingVerified() {
          cascadingMarkedCount += increment
        } else {
          nonCascadingMarkedCount += increment
        }
      }
    }

    if checkedCount != checkableCount * 2 {
      panic("Wrong checked count")
    }
  }

  if checkableCount > items {
    panic("Wrong checkable count")
  }

  if notCascading > items {
    panic("Wrong non-cascading count")
  }

  if callCount != nonCheckableNCount + iterations * (notCascading + (items - notCascading) * 2 + checkableCount * 2 + (items - checkableCount)) {
    panic("Wrong call count")
  }

  if cascadingMarkedCount + nonCascadingMarkedCount > nonCheckableNCount {
    panic("Wrong non-checkable marked count")
  }

  if cascadingMarkedCount + nonCascadingMarkedCount != iterations * nonCheckableMarkedCount {
    panic("Wrong non-checkable marked count")
  }

  if cascadingMarkedCount > iterations * (items - notCascading) {
    panic("Wrong cascading marked count")
  }

  if nonCascadingMarkedCount > iterations * notCascading {
    panic("Wrong non-cascading marked count")
  }

  return expected ^ cascadingMarkedCount
}

func measure(expected uint64, mAVec []M_A) {
  var actual uint64 = 0
  var actualMarkedCount uint64 = 0

  fmt.Print("Benchmark started...")
  var start = time.Now()

  var status = false

  for j := uint64(0); j < iterations; j++ {
    for i := uint64(0); i < items; i++ {
      var maElement = mAVec[i]
      status = maElement.isCascading()
      if status {
        status = status && maElement.isConstrained()
        if status {
          result = maElement.getKind() == METHOD
          result = maElement.getKind() == PROPERTY

          if result {
            actual = (actual << 1 | 1) % 9223372036854775783
          } else {
            actual = (actual << 1) % 9223372036854775783
          }
        } else {
          if n, ok := maElement.(N); ok && n.isMarked() {
            actualMarkedCount++
          }
        }
      }
    }
  }

  var timeMs = time.Since(start).Milliseconds()
  var result = actual ^ actualMarkedCount
  if result == expected {
    fmt.Printf(" done. Total time: %d ms\n", timeMs)
  } else {
    fmt.Printf(" failed in %d ms: expected %d, actual %d.\n", timeMs, expected, result)
  }
}

func main() {
  args := os.Args
  if len(args) > 4 {
      fmt.Println("Usage: program <repeats> [items] [iterations]")
      fmt.Println("   where default value of items is", items)
      fmt.Println("     and default value of iterations is", iterations)
      return
  }

  var R, err = strconv.ParseUint(args[1], 10, 64)
  if err != nil {
      return
  }

  if len(args) > 2 {
    if items, err = strconv.ParseUint(args[2], 10, 64); err != nil {
        return
    }
  }

  if len(args) > 3 {
    if iterations, err = strconv.ParseUint(args[3], 10, 64); err != nil {
        return
    }
  }

  var mAVec []M_A
  for i := uint64(0); i < items; i++ {
    if i % 20 == 0 {
      mAVec = append(mAVec, makeNAAA())
    } else if i % 2 == 0 {
      mAVec = append(mAVec, makeMAAC())
    } else if i % 3 == 0 {
      mAVec = append(mAVec, makeMAAB())
    } else {
      mAVec = append(mAVec, makeMAAA())
    }
  }

  var expected = verify(iterations, mAVec)

  for i := uint64(0); i < R; i++ {
    measure(expected, mAVec)
  }
}
