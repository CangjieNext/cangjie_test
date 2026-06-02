/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a02_02

  @Level:         1

  @Assertion:   8.2.1(2) These functions can be generic functions, support generic constraints,
                support overloading, and also support default parameters and named parameters.

  @Description: Checks that extension support overloading for functions (generic or simple).

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {
    func foo(): Int64 { 0 }

    func next1<T>(a: T) : T where T <: Countable<T> {
        a.next(1)
    }
}

extend A {
    func foo(a: Int64): Int64 { a + 1 }
    
    func foo(a: String): Int64 { a.size }
}

extend A {
    func next1<T>(a: T, b: Int64) : T where T <: Countable<T> {
        a.next(b)
    }
}

main() {
    let x = A()
    Assert.equals(0, x.foo())
    Assert.equals(6, x.foo(5))
    Assert.equals(7, x.foo("dddddcc"))
    Assert.equals(8, x.next1(7))
    Assert.equals(20, x.next1(13, 7))
}
