
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a08_01

  @Level:         1

  @Assertion:   4.21(8) The following example shows the usuage of the coalescing expression:
                main(): Int64 {
                    let v1 = Option<Int64>.Some(100)
                    let v2 = Option<Int64>.None
                    let r1 = v1 ?? 0
                    let r2 = v2 ?? 0
                    print("${r1}") // output: 100
                    print("${r2}") // output: 0
                    return 0
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main(): Int64 {
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<Int64>.None
    let r1 = v1 ?? 0
    let r2 = v2 ?? 0
    print("${r1}") // output: 100
    Assert.equals(100, r1)
    print("${r2}") // output: 0
    Assert.equals(0, r2)
    return 0
}