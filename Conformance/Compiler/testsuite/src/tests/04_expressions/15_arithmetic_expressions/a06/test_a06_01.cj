
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a06_01

  @Level:         1

  @Assertion:   4.15(6) 
                let num1: Int64 = 8
                let num2 = -num1 // num2 = -8, with 'Int64' type 
                let num3 = -(-num1) // num3 = 8, with 'Int64' type
  @Description: Checks the given example
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let num1: Int64 = 8
    let num2 = -num1 // num2 = -8, with 'Int64' type 
    let num3 = -(-num1) // num3 = 8, with 'Int64' type

    Assert.equals(-8, num2)
    Assert.isTrue(num2 is Int64)
    Assert.equals(8, num3)
    Assert.isTrue(num3 is Int64)
}
