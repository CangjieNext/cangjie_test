/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_02_a01_01

  @Level:         1
   @Assertion:   2.1.7.2(1) Tuples can also be used to deconstruct another tuple value,
                 i.e., binding elements at different locations in a tuple to different variables.


   @Description: Check the deconstruct various tuples into different variables.
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

func my() {
    "Hi"
}

struct R1 {
    let smth = 123
}

enum HandGame {
    ROCK | PAPER | SCISSORS
}

open class C1 {
    var some = 321
}

func getTuple1() {
    (123, 321)
}

func getTuple2() {
    ((1.23, 3.21f16), true, "Bla-bla-bla")
}

func getTuple3() {
    var r1 = R1()
    var c1 = C1()

    (r1, (c1, HandGame.SCISSORS))
}

func getTuple4() {
    ([1,2,3], (1..=2, my), my())
}

main() {
    var (x1, y1) = getTuple1()
    Assert.equals(123, x1)
    Assert.equals(321, y1)

    var ((x2, y2), b2, s2) = getTuple2()
    Assert.equals(1.23, x2)
    Assert.equals(3.21, y2)
    Assert.equals(true, b2)
    Assert.equals("Bla-bla-bla", s2)

    var (c2, _, _) = getTuple2()
    Assert.equals(1.23, c2[0])
    Assert.equals(3.21f16, c2[1])

    var (r3, (c3, e3)) = getTuple3()
    Assert.equals(123, r3.smth)
    Assert.equals(321, c3.some)
    Assert.isTrue(match(e3) {
      case HandGame.SCISSORS => true
      case _ => false
    })

    var (a4, (r4, f4), s4) = getTuple4()
    Assert.equals(2, a4[1])
    var range_str = ""
    for (el in r4) {
      range_str += el.toString()
    }
    Assert.equals("12", range_str)
    Assert.equals("Hi", f4())
    Assert.equals("Hi", s4)

    return 0
}
