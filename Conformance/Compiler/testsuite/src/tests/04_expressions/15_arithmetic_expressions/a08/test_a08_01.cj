
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a08_01

  @Level:         1

  @Assertion:   4.15(8)
                let a = 2 + 3 // add 5
                let b = 3 - 1 // sub 2
                let c = 3 * 4 // multi 12
                let d = 6.6 / 1.1 // division 6
                let e = 4 % 3 // mod 1

  @Description: Checks the given example
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

main() {
    let a = 2 + 3 // add 5
    let b = 3 - 1 // sub 2
    let c = 3 * 4 // multi 12
    let d = 6.6 / 1.1 // division 6
    let e = 4 % 3 // mod 1

    Assert.equals(5, a)
    Assert.equals(2, b)
    Assert.equals(12, c)
    Assert.approxEquals(6.0, d)
    Assert.equals(1, e)
}
