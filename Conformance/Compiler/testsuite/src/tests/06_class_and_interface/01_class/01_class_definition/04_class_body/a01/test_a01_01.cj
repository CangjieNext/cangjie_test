/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a01_01

  @Level:         1

  @Assertion: 6.1.1.4(1)
              The class body is consisted of zero or more member declarations which are enclosed in a pair of curly brackets.

  @Description: Check that the class body can consist of zero or more member declarations

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a01_01.cj

  @Issue: 0006124

*/

import t01.*

import utils.assert.Assert

class Empty {}
class EmptyG<T> {}

class One {
  var x = 1
}

class OneG<T> {
  let y = 2
}

class Two {
  func f1() {
    return 3
  }
  func f2() {
    return 4
  }
}

class TwoG<T> {
  func f1(x: T) {
    return 5
  }
  func f2(x: String) {
    return 6
  }
}

class Three {
  prop p1: Int64 {
    get() {
      7
    }
  }

  prop p2: Int64 {
    get() {
      8
    }
  }

  mut prop p3: Int64 {
    get() {
      9
    }
    set(v) {}
  }
}

class ThreeG<T> {
  prop p1: Int64 {
    get() {
      10
    }
  }

  mut prop p2: Int64 {
    get() {
      11
    }
    set(v) {}
  }

  prop p3: Int64 {
    get() {
      12
    }
  }
}

class Four {
  @Ident(ident)

  @Add(add)

  @Sub(sub)

  @Concat(concat)
}

class FourG<T> {
  @Ident(ident_g)

  @Add(add_g)

  @Sub(sub_g)

  @Concat(concat_g)
}

main() {
  var empty = Empty()
  var empty_g = EmptyG<Unit>()

  var one = One()
  Assert.equals(1, one.x)

  var one_g = OneG<Rune>()
  Assert.equals(2, one_g.y)

  let two = Two()
  Assert.equals(3, two.f1())
  Assert.equals(4, two.f2())

  let two_g = TwoG<Int32>()
  Assert.equals(5, two_g.f1(1))
  Assert.equals(6, two_g.f2("2"))

  var three = Three()
  Assert.equals(7, three.p1)
  Assert.equals(8, three.p2)
  Assert.equals(9, three.p3)

  var three_g = ThreeG<String>()
  Assert.equals(10, three_g.p1)
  Assert.equals(11, three_g.p2)
  Assert.equals(12, three_g.p3)

  var four = Four()
  Assert.equals(10, four.ident(10))
  Assert.equals(20, four.add(10, 10))
  Assert.equals(0, four.sub(10, 10))
  Assert.equals("String", four.concat("St", "ring"))

  var four_g = FourG<Float64>()
  Assert.equals(100, four_g.ident_g(100))
  Assert.equals(15, four_g.add_g(7, 8))
  Assert.equals(-1, four_g.sub_g(7, 8))
  Assert.equals("-1", four_g.concat_g("-", "1"))
}
