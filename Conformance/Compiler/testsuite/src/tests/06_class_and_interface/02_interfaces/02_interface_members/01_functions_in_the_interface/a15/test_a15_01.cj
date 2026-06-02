/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a15_01

  @Level:         1

  @Assertion: 6.2.2.1(15)
              interface I {
                mut func f(): Unit
              }

  @Description: Check that the function from the example can be implemented
                by a struct as a mut function

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    mut func f(): Unit
}

struct A <: I {
    A(var x!: Int64 = 0) {}
    mut public func f() {
        x = 20
    }
}

main () {
    var a = A()
    a.f()
    Assert.equals(20, a.x)
}