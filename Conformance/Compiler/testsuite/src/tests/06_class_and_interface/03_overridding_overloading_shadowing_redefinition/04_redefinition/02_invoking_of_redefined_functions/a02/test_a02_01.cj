/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_02_a02_01

  @Level:         1

  @Assertion: 6.3.4.2(2)
              In the following example, the function f is defined in class C1,
              and f is redefined in its subclass C2. When the function f is called via C1 and C2,
              the corresponding function is selected based on their types at compile time.
              open class C1 {
                static func f(): Unit {
                  return
                }
              }
              class C2 <: C1 {
                redef static func f(): Unit {
                  return
                }
              }
              // Invokes f of C1
              var c = C1.f()
              // Invokes f of C2
              var d = C2.f()

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var C1_counter = 0
var C2_counter = 0

open class C1 {
    static func f(): Unit {
        C1_counter++
        return
    }
}
class C2 <: C1 {
    redef static func f(): Unit {
        Assert.equals(1, C1_counter)
        C2_counter++
        return
    }
}

// Invokes f of C1
var c = C1.f()
// Invokes f of C2
var d = C2.f()

main() {
    Assert.equals(1, C1_counter)
    Assert.equals(1, C2_counter)
}