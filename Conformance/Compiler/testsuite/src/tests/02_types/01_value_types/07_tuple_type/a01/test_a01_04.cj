/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a01_04

  @Level:         1
   @Assertion:   2.1.7(1) Tuple is an immutable data structure that can contain a heterogeneous sequence of elements.
   @Description: Check that tuple can contain a heterogeneous sequence of elements.
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

main() {
    var r1 = R1()
    var c1 = C1()
    var t1: (Int64, String, Float16, Bool, Rune, (Int16, UInt16), Unit, Range<Int64>,
        () -> String, R1, HandGame, Array<Float16>, C1)
    t1 = (1, "2asd", 2.453, true, r'i', (-1, 1), (), 1..10, my, r1, HandGame.ROCK, [0.0, 0.1], c1)
    Assert.isTrue(t1 is (Int64, String, Float16, Bool, Rune, (Int16, UInt16), Unit, Range<Int64>,
        () -> String, R1, HandGame, Array<Float16>, C1)
    )
    return 0
}
