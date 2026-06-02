/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a03_05

  @Level:         1

  @Assertion:    3.2.4(3) If the name C is a type, the type in the upper-scope is shadowed.

  @Description:  Check shadowing type alias name

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

struct Dummy { }

type T = Dummy

class C {
    var myField: String

    func T() {
        if (true) {
            func T(): Int64 { 1 }
            Assert.equals(1, T())
        }
        if (true) {
            var T: Bool = true
            Assert.equals(true, T)
            myField = "done"
        }
    }

    C() {
        myField = "foo"
        T()
    }
}

main() {
    var t = C()
    Assert.equals("done", t.myField)

    for (T in 0..1) {
        Assert.isTrue(T is Int64)
    }

    match (Dummy()) {
        case x: T => if (true) {
                let T = C()
                Assert.isTrue(T is C)
            }
        case _ => throw Exception("Must not happen")
    }

    match (t) {
        case T => Assert.isTrue(T is C)
    }

    func T(): Bool { true }
    Assert.isTrue(T())
}
