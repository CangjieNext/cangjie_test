/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a26_01

  @Level:         1

  @Assertion:   6.1.2.2(26) •The code of a static initializer is synchronized to protect against leaking of partially
                initialized classes or structs;
  @Description: Checks that not initialing a mutable static variable neither directly nor in a static initializer
                results in a compilation error for class.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert
import std.sync.*

class C <: A {
    static var y = AtomicInt64(0)

    static init() {
        y.fetchAdd(1)
    }
}

abstract class A {
    static var x = AtomicInt64(0)

    static init() {
        x.fetchAdd(1)
    }
}

class G<T> {
    static var x = AtomicInt64(0)

    static init() {
        x.fetchAdd(1)
    }
}

struct S {
    static var x = AtomicInt64(0)

    static init() {
        x.fetchAdd(1)
    }
}

main() {
    Assert.equals(1, C.y.load())
    Assert.equals(1, A.x.load())
    Assert.equals(1, G<Unit>.x.load())
    Assert.equals(1, S.x.load())
}
