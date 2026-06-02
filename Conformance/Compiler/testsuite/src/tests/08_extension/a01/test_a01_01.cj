/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a01_01

  @Level:         1

  @Assertion:   8(1) Extensions can add new functionality to any type visible in the current
                package, except for functions, tuples, and interfaces.

  @Description: Checks that extending of different types works as expected.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

class A {
    var a: Int64 = 7
}

extend A {
    func getA() { a + 1 }
}

extend Int64 {
    func toInt32() { Int32(this + 1) }
}

struct S {
    var d: Int32 = 0
}

extend S {
    mut prop val: Int32 {
        get() { d + 1 }
        set(v) { d = v + 1 }
    }
}

main() {
    let x = A()
    var a1: Int64 = x.getA()
    Assert.equals(8, a1)
    var a2: Int32 = a1.toInt32()
    Assert.equals(9, a2)
    var y = S()
    y.val = a2
    var a3: Int32 = y.val
    Assert.equals(11, a3)
    return 0;
}
