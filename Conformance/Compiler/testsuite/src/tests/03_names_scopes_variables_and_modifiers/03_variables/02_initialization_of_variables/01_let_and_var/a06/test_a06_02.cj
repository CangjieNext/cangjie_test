/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a06_02

  @Level:         1
  @Assertion:    3.3.2.1(6)
    func f() {
         let a = 1                   // Define and initialize immutable variable a.
         a = 2                       // error: immutable variable a cannot be reassigned.
         var b: Float32 = 3.14 // Define and initialize mutable b.
         b = 3.1415                  // ok: mutable variable b can be reassigned.
    }

    class C {
         let m1: Int64
         init(a: Int64, b: Int64) {
              m1 = a
               if (b > 0) {
                   m1 = a * b      // OK: immutable variable can be reassigned in constructor.
              }
         }
    }

  @Description:  Checks that example from spec works after fixing

  @Mode:         run
  @Negative:     no
  @Structure:    single
*/

import utils.assert.Assert

func f() {
    let a = 1                   // Define and initialize immutable variable a.
    var b: Float32 = 3.14 // Define and initialize mutable b.
    b = 3.1415                  // ok: mutable variable b can be reassigned.
}

class C {
    let m1: Int64
    init(a: Int64, b: Int64) {
        if (b > 0) {
            m1 = a * b      // OK: immutable variable can be reassigned in constructor.
        } else {
            m1 = a
        }
    }
}

main() {
    var c = C(10, 1_123_345);
    Assert.equals(10 * 1_123_345, c.m1, reason: "Re-init value should be used")

    c = C(10, -5);
    Assert.equals(10, c.m1, reason: "Init value should be used")
}
