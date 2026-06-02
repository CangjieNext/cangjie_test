/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_04_a01_01

  @Level:         1
   @Assertion:   2.1.7.4(1) The type annotation can be omitted when defining a variable of Tuple type,
                 which can be inferred by the compiler.

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

func getTuple4() {
    ([1,2,3], (1..=2, my), my())
}

main() {
    var t1 = (123, 321)
    Assert.isTrue(t1 is (Int64, Int64))

    var t2 = ((1.23, 3.21f16), true, "Bla-bla-bla")
    Assert.isTrue(t2 is ((Float64, Float16), Bool, String))

    var r1 = R1()
    var c1 = C1()
    let t3 = (r1, (c1, HandGame.SCISSORS))
    Assert.isTrue(t3 is (R1, (C1, HandGame)))

    let t4 = ([1_i16, 2i16, 3i16], (1..=2, my), my())
    Assert.isTrue(t4 is (Array<Int16>, (Range<Int64>, () -> String), String))

    return 0
}
