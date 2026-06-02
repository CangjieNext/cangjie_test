
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a17_01

  @Level:         1

  @Assertion:   6.1.2.2(17) –Despite the fact that mutable static variables may be assigned both directly and in a
                static initializer, the variable initialization in this case would be only direct assignment, while the
                assignment in a static initializer is considered as a simple reassignment.
  @Description: Checks that a mutable static member variable is first initialized directly and then reassigned in the
                static initializer.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var s = ""

func f(str : String) {
    s += str + "f"
    1
}

func g(str : String) {
    s += str + "g"
    2
}

abstract class A {
    static var x = f("A")

    static init() {
        x = g("A")
    }
}

class C <: A {
    static var y = f("C")

    static init() {
        y = g("C")
    }
}

class G<T> {
    static var x = f("G")

    static init() {
        x = g("G")
    }
}

struct S {
    static var x = f("S")

    static init() {
        x = g("S")
    }
}

main() {
    Assert.equals(2, A.x)
    Assert.equals(2, C.y)
    Assert.equals(2, S.x)
    Assert.equals(2, G<Unit>.x)
    Assert.equals(2, G<String>.x)
    Assert.equals("AfAgCfCgGfGgSfSg", s)
}
