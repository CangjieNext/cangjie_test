/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a10_01

  @Level:         1
  @Assertion:    3.2.4(10) The following example illustrate shadowing on variables in different scenarios.

  @Mode:         run
  @Negative:     no

*/

import utils.assert.Assert

func g(): Unit {
    f(1, 2)  // OK. f is a top-level definition, which is visible in the whole file
}

func f(x: Int32, y: Int32): Unit {
    var i = 1         // OK
    for (i in 1..3) { // OK, a new i in the block
        let v = 1
    }                 // i and v disappear

    print("${i}")     // OK. i is defined at line 9
    Assert.equals(1, i) // added to orig code
}

main() {
    f(10, 20)         // added to orig code
}
