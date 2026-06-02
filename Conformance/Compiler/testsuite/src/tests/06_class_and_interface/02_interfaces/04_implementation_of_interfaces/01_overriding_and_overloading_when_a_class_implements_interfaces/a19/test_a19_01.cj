/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a19_01

  @Level:         1

  @Assertion: 6.2.4.1(19)
              Example 3: In the following example,
              a function named f with parameter type Unit is declared in interface I1.
              A default function named f with parameter type Int32 is declared in interface I2.
              A function namedf with parameter type Unit must be implemented in class C.
              interface I1 {
                func f(): Unit
              }
              interface I2 {
                func f(a: Int32):Unit {
                  return
                }
              }
              class C <: I1 & I2 {
                public func f(): Unit {
                  return
                }
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f(): Unit
}
interface I2 {
    func f(a: Int32):Unit {
        return
    }
}
class C <: I1 & I2 {
    public func f(): Unit {
        return
    }
}

main() {
    let c = C()
    Assert.isTrue(c.f() is Unit)
    Assert.isTrue(c.f(1i32) is Unit)
}