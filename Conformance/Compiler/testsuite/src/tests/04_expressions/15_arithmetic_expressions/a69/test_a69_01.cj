
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a69_01

  @Level:         1

  @Assertion:   4.15(69)
                @OverflowWrapping
                func test(x: Int8, y: Int8) {
                    let z1 = x * y // No exception will be thrown when overflow occurs
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

@OverflowWrapping
func test(x: Int8, y: Int8) {
    let z1 = x * y // No exception will be thrown when overflow occurs
    return z1
}

main() {
    Assert.equals(73, test(99, 99))
}
