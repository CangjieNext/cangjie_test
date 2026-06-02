
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_01_a03_01

  @Level:         1

  @Assertion:   4.7.1(3) In the following example, a break expression is used in a while expression which computes the
                lowest common multiple of 4 and 6 (i.e., 12).
                main(): Int64 {
                    var index: Int32 = 0 
                    while (index < 50) {
                        index = index + 1
                        if ((index % 4 == 0) && (index % 6 == 0)) {
                            print("${index} is divisible by both 4 and 6") // output: 12 
                            break
                        }
                    }
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
    var index: Int32 = 0 
    while (index < 50) {
        index = index + 1
        if ((index % 4 == 0) && (index % 6 == 0)) {
            print("${index} is divisible by both 4 and 6") // output: 12 
            break
        }
    }
    Assert.equals(12, index)
    return 0
}
