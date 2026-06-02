
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a07_01

  @Level:         1

  @Assertion:   4.7.3(7)
                func larger(a: Int32, b: Int32): Int32 { 
                    if (a >= b) {
                        return a
                    } else {
                        return b
                    }
                }
  @Description: Checks the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func larger(a: Int32, b: Int32): Int32 { 
    if (a >= b) {
        return a
    } else {
        return b
    }
}

main() {
    Assert.equals(5, larger(3, 5))
    Assert.equals(5, larger(5, 3))
}
