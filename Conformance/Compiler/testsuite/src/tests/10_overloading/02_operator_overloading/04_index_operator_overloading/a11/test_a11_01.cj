/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a11_01

  @Level:         1

  @Assertion: 10.2.4(11)
              class A {
                  operator func [](arg1: Int64, arg2: String, value!: Int64): Unit {
                      return
                  }
              }

              func f() {
                  let a = A()
                  a[1, "2"] = 0
              }

  @Description: Check compilation of the example provided.

  @Mode: compileonly

  @Negative: no

*/

class A {
    operator func [](arg1: Int64, arg2: String, value!: Int64): Unit {
        return
    }
}

func f() {
    let a = A()
    a[1, "2"] = 0
}

main() {}

