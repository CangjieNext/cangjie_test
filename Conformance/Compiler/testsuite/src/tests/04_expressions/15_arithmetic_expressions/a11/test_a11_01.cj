
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a11_01

  @Level:         1

  @Assertion:   4.15(11)
                let q1 = 7 / 3  // integer division: 2
                let q2 = -7 / 3  // integer division: -2
                let q3 = 7 / -3  // integer division: -2
                let q4 = -7 / -3 // integer division: 2
                let r1 = 7 % 3  // integer remainder: 1
                let r2 = -7 % 3  // integer remainder: -1
                let r3 = 7 % -3  // integer remainder: 1
                let r4 = -7 % -3 // integer remainder: -1
  @Description: Checks the given example
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let q1 = 7 / 3  // integer division: 2
    let q2 = -7 / 3  // integer division: -2
    let q3 = 7 / -3  // integer division: -2
    let q4 = -7 / -3 // integer division: 2
    let r1 = 7 % 3  // integer remainder: 1
    let r2 = -7 % 3  // integer remainder: -1
    let r3 = 7 % -3  // integer remainder: 1
    let r4 = -7 % -3 // integer remainder: -1

    Assert.equals(2, q1)
    Assert.equals(-2, q2)
    Assert.equals(-2, q3)
    Assert.equals(2, q4)
    Assert.equals(1, r1)
    Assert.equals(-1, r2)
    Assert.equals(1, r3)
    Assert.equals(-1, r4)
}
