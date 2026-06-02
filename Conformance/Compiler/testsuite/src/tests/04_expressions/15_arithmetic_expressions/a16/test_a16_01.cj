
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a16_01

  @Level:         1

  @Assertion:   4.15(16)
                let p1 = 2 ** 3 // p1 = 8
                let p2 = 2 ** UInt64(3 ** 2) // p2 = 512
                let p3 = 2.0 ** 3.0 // p3 = 8.0
                let p4 = 2.0 ** 3 ** 2 // p4 = 512.0
                let p5 = 2.0 ** 3.0 // p5 = 8.0
                let p6 = 2.0 ** 3.0 ** 2.0 // p6 = 512.0
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

main() {
    let p1 = 2 ** 3 // p1 = 8
    let p2 = 2 ** UInt64(3 ** 2) // p2 = 512
    let p3 = 2.0 ** 3.0 // p3 = 8.0
    let p4 = 2.0 ** 3 ** 2 // p4 = 512.0
    let p5 = 2.0 ** 3.0 // p5 = 8.0
    let p6 = 2.0 ** 3.0 ** 2.0 // p6 = 512.0

    Assert.equals(8, p1)
    Assert.equals(512, p2)
    Assert.approxEquals(8.0, p3)
    Assert.approxEquals(512.0, p4)
    Assert.approxEquals(8.0, p5)
    Assert.approxEquals(512.0, p6)
}

