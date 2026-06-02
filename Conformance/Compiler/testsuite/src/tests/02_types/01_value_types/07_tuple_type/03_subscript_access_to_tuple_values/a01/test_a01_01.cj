/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_03_a01_01

  @Level:         1
   @Assertion:   2.1.7.3(1) Elements in specific locations can be accessed through tupleName[index]
                 (index indicates the location in the tuple which starting from `zero`,
                 and can only be an integer literal).

   @Description: Check the access though index to various tuples values.
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
    var z1 = getTuple1()
    Assert.equals(123, z1[0])
    Assert.equals(321, z1[1_i64])

    var z2 = getTuple2()
    Assert.equals(1.23, z2[0][0])
    Assert.equals(3.21, z2[0][1])
    Assert.equals(true, z2[1])
    Assert.equals("Bla-bla-bla", z2[2])

    var z3 = getTuple3()
    Assert.equals(123, z3[0].smth)
    Assert.equals(321, z3[1][0].some)
    Assert.isTrue(match(z3[1][1]) {
      case HandGame.SCISSORS => true
      case _ => false
    })

    var z4 = getTuple4()
    Assert.equals(2, z4[0][1])
    var range_str = ""
    for (el in z4[1][0]) {
      range_str += el.toString()
    }
    Assert.equals("12", range_str)
    Assert.equals("Hi", z4[1][1]())
    Assert.equals("Hi", z4[2])

    return 0
}
