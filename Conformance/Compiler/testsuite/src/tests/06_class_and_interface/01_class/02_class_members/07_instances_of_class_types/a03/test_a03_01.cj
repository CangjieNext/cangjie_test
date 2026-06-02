/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a03_01

  @Level:         1

  @Assertion: 6.1.2.7(3)
              class C {
                var a: Int32 = 1
                init(a: Int32) {
                  this.a = a
                }
                init(a: Int32, b: Int32) {
                  this.a = a + b
                }
              }
              main() : Int64 {
                var myC = C(2) // invoke the first constructor
                var myC2 = C(3, 4) // invoke the second constructor
                return 0
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no


*/

import utils.assert.Assert

class C {
    var a: Int32 = 1
    init(a: Int32) {
        this.a = a
    }
    init(a: Int32, b: Int32) {
        this.a = a + b
    }
}

main() : Int64 {
    var myC = C(2) // invoke the first constructor
    var myC2 = C(3, 4) // invoke the second constructor
    Assert.equals(2, myC.a)
    Assert.equals(7, myC2.a)
    return 0
}