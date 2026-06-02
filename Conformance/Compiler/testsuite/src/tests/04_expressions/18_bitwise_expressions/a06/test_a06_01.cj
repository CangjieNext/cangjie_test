
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a06_01

  @Level:         1

  @Assertion:   4.18(6) Examples for bitwise expressions:
                func foo(): Unit {
                    !10 // The result is -11
                    !20 // The result is -21
                    10 << 1 // The result is 20
                    10 << 1 << 1 // The result is 40
                    10 >> 1 // The result is 5
                    10 & 15 // The result is 10
                    10 ^ 15 // The result is 5
                    10 | 15 // The result is 15 1 ^ 8 & 15 | 24 // The result is 25
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func foo(): Unit {
    Assert.equals(-11, !10) // The result is -11
    Assert.equals(-21, !20) // The result is -21
    Assert.equals(20,  10 << 1) // The result is 20
    Assert.equals(40, 10 << 1 << 1) // The result is 40
    Assert.equals(5, 10 >> 1) // The result is 5
    Assert.equals(10, 10 & 15) // The result is 10
    Assert.equals(5, 10 ^ 15) // The result is 5
    Assert.equals(15, 10 | 15) // The result is 15
    Assert.equals(25, 1 ^ 8 & 15 | 24) // The result is 25
}


main() {
    foo()
    0
}