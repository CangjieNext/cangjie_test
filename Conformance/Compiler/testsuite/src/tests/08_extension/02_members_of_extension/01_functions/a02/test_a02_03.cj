/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a02_03

  @Level:         1

  @Assertion:   8.2.1(2) These functions can be generic functions, support generic constraints,
                support overloading, and also support default parameters and named parameters.

  @Description: Checks that extension support default parameters and named parameters.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {}

extend A {
    func foo1(a!: Int64): Int64 { a + 1 }

    func foo2(a: Int64, b!: Int64): Int64 { a + b }
    
    func foo3(a: Int64, b!: Int64 = 1): Int64 { a + b }
}

main() {
    let x = A()
    Assert.equals(4, x.foo1(a:3))
    Assert.equals(8, x.foo2(3, b: 5))
    Assert.equals(10, x.foo3(9))
    Assert.equals(12, x.foo3(9, b: 3))
}
