
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_16_a05_01

  @Level:         1

  @Assertion:   4.16(5) Examples for relational expressions:
                main(): Int64 {
                    3 < 4 // return true
                    3 <= 3 // return true
                    3 > 4 // return false
                    3 >= 3 // return true
                    3.14 == 3.15 // return false
                    3.14 != 3.15 // return true
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
    Assert.equals(true, 3 < 4) // return true
    Assert.equals(true, 3 <= 3) // return true
    Assert.equals(false, 3 > 4) // return false
    Assert.equals(true, 3 >= 3) // return true
    Assert.equals(false, 3.14 == 3.15) // return false
    Assert.equals(true, 3.14 != 3.15) // return true
    return 0
}
