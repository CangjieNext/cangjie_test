/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_a01_03

  @Level:         1

  @Assertion:   8.2(1) Extended members include: static member functions, instance member functions,
                static member properties, instance member properties, operator overloaded functions,
                and operator overloaded functions.

  @Description: Checks different types of extended members of Int64.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6124

*/

import utils.assert.Assert

extend Int64 {
    static func foo1(): Int64 { 7 }

    func foo2(): Int64 { this }

    static prop p1: Int64 {
        get() { 3 }
    }

    prop p2: Int64 {
        get() { this }
    }

    operator func +(right: Bool): Int64 {
        if (right) {
            return p2 + 1
        }
        return p2
    }
}

main() {
    let x1 = 3
    let x2 = true
    let x3 = false
    let y1 = x1 + x2
    let y2 = x1 + x3
    Assert.equals(7, Int64.foo1())
    Assert.equals(3, Int64.p1)
    Assert.equals(4, y1.foo2())
    Assert.equals(4, y1.p2)
    Assert.equals(3, y2.foo2())
    Assert.equals(3, y2.p2)
    return 0
}
