
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a71_01

  @Level:         1

  @Assertion:   4.15(71)
                @OverflowWrapping
                func test(x: Int8, y: Int8) { // If x equals -128 and y equals -1
                    let z1 = x * y // z1 would be -128
                    let z2 = x / y // z2 would be -128
                    let z3 = x % y // z3 would be 0
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

@OverflowWrapping
func test(x: Int8, y: Int8) { // If x equals -128 and y equals -1
    let z1 = x * y // z1 would be -128
    let z2 = x / y // z2 would be -128
    let z3 = x % y // z3 would be 0

    Assert.equals(-128, z1)
    Assert.equals(-128, z2)
    Assert.equals(0, z3)
}

main() {
    test(-128, -1)
}
