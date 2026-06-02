/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a05_01

  @Level:         1

  @Assertion: 5.6(5) If the captured variable is of reference type, you can modify the value of its variable instance 
              member variable

  @Description: Check that variable of reference type captured in closure allows modification of its instance members.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var x: Int64 = 0
}

main() {
    var c1 = C()
    let c2 = C()

    func foo() {
        c1.x = 2
        c2.x = 3
        c1.x * c2.x
    }
    Assert.equals(6, foo())
}

