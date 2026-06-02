
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a18_01

  @Level:         1

  @Assertion:   6.1.2.2(18) That means before the static initializer is called, that variable would have a value
                assigned directly.
  @Description: Checks at the start of static initializer code that static variable has the same value as the one that
                was assigned to it directly.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

abstract class A {
    static var x = 1

    static init() {
        Assert.equals(1, x)
        Assert.equals(1, A.x)
    }
}

class C <: A {
    static var y = 1

    static init() {
        Assert.equals(1, y)
        Assert.equals(1, C.y)
    }
}

class G<T> {
    static var x = 1

    static init() {
        Assert.equals(1, x)
        Assert.equals(1, G<Int64>.x)
    }
}

struct S {
    static var x = 1

    static init() {
        Assert.equals(1, x)
        Assert.equals(1, S.x)
    }
}

main(): Unit {
    G<Unit>()
    G<String>()
}
