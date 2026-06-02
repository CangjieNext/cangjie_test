/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a03_01

  @Level:         1
   @Assertion:   2.1.7(3) Any TypeI from Type1 to TypeN can be any type
                 (N cannot be less than two, i.e., a tuple is of at least two dimensions).
   @Description: Check that tuple can contain any type.
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

func my() {
    "Hi"
}

struct R1 { // error: 'R1' cannot have a member that recursively contains it
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
    var t1: (Int64, String) = (54, "Privet")
    let t2: (Float16, Bool) = (3.14, true)
    var t3: (Rune, (Int16, UInt16)) = (r'y', (-54, 64))
    let t4: (Unit, Range<Int64>) = ((), 6..1 : -1)
    var t5: (() -> String, R1) = (my, r1)
    let t6: (HandGame, Array<Float16>, C1) = (HandGame.ROCK, [0.0, 0.1], c1)
    Assert.isTrue(t1 is (Int64, String))
    Assert.isTrue(t2 is (Float16, Bool))
    Assert.isTrue(t3 is (Rune, (Int16, UInt16)))
    Assert.isTrue(t4 is (Unit, Range<Int64>))
    Assert.isTrue(t5 is (() -> String, R1))
    Assert.isTrue(t6 is (HandGame, Array<Float16>, C1))
    return 0
}
