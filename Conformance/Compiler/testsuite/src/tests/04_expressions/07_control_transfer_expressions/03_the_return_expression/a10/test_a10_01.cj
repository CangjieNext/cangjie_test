
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a10_01

  @Level:         1

  @Assertion:   4.7.3(10)
                func equal(a: Int32, b: Int32): Unit { 
                    if (a == b) {
                        print("a is equal to b")
                        return
                    } else {
                        print("a is not equal to b")
                    }
                }
  @Description: Checks the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func equal(a: Int32, b: Int32): Unit { 
    if (a == b) {
        print("a is equal to b")
        return
    } else {
        print("a is not equal to b")
    }
}

main() {
    Assert.isTrue(equal(1, 1) is Unit)
    Assert.isTrue(equal(1, 2) is Unit)
}
