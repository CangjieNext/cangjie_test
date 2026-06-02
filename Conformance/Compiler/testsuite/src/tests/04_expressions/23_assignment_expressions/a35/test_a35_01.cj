
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a35_01

  @Level:         1

  @Assertion:   4.23(35)
                main(): Int64 {
                    var a: Int64
                    var b: Int64
                    (a, b) = (1, 2)
                    // desugar
                    let temp = (1, 2)
                    a = temp[0]
                    b = temp[1]
                    return 0
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

main(): Int64 {
    var a1: Int64
    var b1: Int64
    (a1, b1) = (1, 2)
    Assert.equals(1, a1)
    Assert.equals(2, b1)
    // desugar
    let temp = (1, 2)
    var a2: Int64
    var b2: Int64
    a2 = temp[0]
    b2 = temp[1]
    Assert.equals(1, a2)
    Assert.equals(2, b2)

    return 0
}