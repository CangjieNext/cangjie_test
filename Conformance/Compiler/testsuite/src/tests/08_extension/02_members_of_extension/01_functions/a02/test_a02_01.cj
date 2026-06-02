/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a02_01

  @Level:         1

  @Assertion:   8.2.1(2) These functions can be generic functions, support generic constraints,
                support overloading, and also support default parameters and named parameters.

  @Description: Checks that extension can add generic functions (with or without constrains).

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {}

extend A {
    func curr<T>(a: T) : T { a }
}

extend A {
    func next1<T>(a: T) : T where T <: Countable<T> {
        a.next(1)
    }
}

main() {
    let x = A()
    Assert.equals(5, x.curr(5))
    Assert.equals("ee", x.curr("ee"))
    Assert.equals(6, x.next1(5))
}
