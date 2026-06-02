/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a07_04

  @Level:         1

  @Assertion: 4.13.1(7) Note that static members of classes, interfaces, and structs can only have type names
              as their access subjects.

  @Description: Check access to static members of classes, interfaces and structs using type names.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    static func foo() {
        return 1
    }

    static var x = 2
}

struct S {
    static func foo() {
        return 3
    }

    static var x = 4
}

interface I {
    static func foo() {
        return 5
    }
}

main() {
    // Class.
    let cx = C.x
    Assert.equals(2, cx)
    let cf = C.foo
    Assert.equals(1, cf())

    // Struct.
    let sx = S.x
    Assert.equals(4, sx)
    let sf = S.foo
    Assert.equals(3, sf())

    // Interface.
    let f = I.foo
    Assert.equals(5, f())
}

