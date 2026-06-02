/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_a01_02

  @Level:         1

  @Assertion:   8.2(1) Extended members include: static member functions, instance member functions,
                static member properties, instance member properties, operator overloaded functions,
                and operator overloaded functions.

  @Description: Checks different types of extended members of struct.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6124

*/

import utils.assert.Assert

struct S {
    var value: Int64 = 0

    init(a: Int64) { value = a }
}

extend S {
    static func foo1(): Int64 { 7 }

    func foo2(): Int64 { value }

    static prop p1: Int64 {
        get() { 3 }
    }

    mut prop p2: Int64 {
        get() { value }
        set(v) { value = v }
    }
    
    operator func +(right: S): S {
        return S(p2 + right.p2)
    }
}

main() {
    let x1 = S(3)
    let x2 = S(8)
    let y = x1 + x2
    Assert.equals(7, S.foo1())
    Assert.equals(11, y.foo2())
    Assert.equals(3, S.p1)
    Assert.equals(11, y.p2)
    return 0
}
