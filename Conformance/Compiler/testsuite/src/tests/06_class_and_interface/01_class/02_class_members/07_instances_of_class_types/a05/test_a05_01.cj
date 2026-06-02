/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a05_01

  @Level:         1

  @Assertion: 6.1.2.7(5)
              Some examples are given below:
              class C<T, U> {
                var a: T
                var b: U
                init(a: T, b: U) {
                  this.a = a
                  this.b = b
                }
              }
              main() : Int64 {
                var myC = C<Int32, Int64>(3, 4)
                var myC2 = C(3,4) // The type of myC2 is inferred to C<Int64, Int64>.
                return 0
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C<T, U> {
    var a: T
    var b: U
    init(a: T, b: U) {
        this.a = a
        this.b = b
    }
}
main() : Int64 {
    var myC = C<Int32, Int64>(3, 4)
    var myC2 = C(3,4) // The type of myC2 is inferred to C<Int64, Int64>.
    Assert.isTrue(myC is C<Int32, Int64>)
    Assert.equals(3, myC.a)
    Assert.equals(4, myC.b)
    Assert.isTrue(myC2 is C<Int64, Int64>)
    Assert.equals(3, myC2.a)
    Assert.equals(4, myC2.b)
    return 0
}