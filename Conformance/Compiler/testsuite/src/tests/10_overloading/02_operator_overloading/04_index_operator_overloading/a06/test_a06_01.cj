/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a06_01

  @Level:         1

  @Assertion: 10.2.4(6)
              class A {
                  operator func [](arg1: Int64, arg2: String): Int64 {
                      return 0
                  }
              }

              func f() {
                  let a = A()
                  let b: Int64 = a[1, "2"]
                  // b == 0
              }

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class A {
    operator func [](arg1: Int64, arg2: String): Int64 {
        return 0
    }
}

func f() {
    let a = A()
    let b: Int64 = a[1, "2"]
    // b == 0
    Assert.equals(0, b)
}

main() {
    f()
}

