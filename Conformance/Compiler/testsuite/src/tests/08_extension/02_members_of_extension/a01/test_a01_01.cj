/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_a01_01

  @Level:         1

  @Assertion:   8.2(1) Extended members include: static member functions, instance member functions,
                static member properties, instance member properties, operator overloaded functions,
                and operator overloaded functions.

  @Description: Checks different types of extended members of class.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6124

*/

import utils.assert.Assert

class A {
    var value: Int64 = 0

    init(a: Int64) { value = a }
}

extend A {
    static func foo1(): Int64 { 7 }

    func foo2(): Int64 { value }

    static prop p1: Int64 {
        get() { 3 }
    }

    mut prop p2: Int64 {
        get() { value }
        set(v) { value = v }
    }

    operator func +(right: A): A {
        return A(p2 + right.p2)
    }
}

main() {
    let x1 = A(3)
    let x2 = A(8)
    let y = x1 + x2
    Assert.equals(7, A.foo1())
    Assert.equals(11, y.foo2())
    Assert.equals(3, A.p1)
    Assert.equals(11, y.p2)
    return 0
}
