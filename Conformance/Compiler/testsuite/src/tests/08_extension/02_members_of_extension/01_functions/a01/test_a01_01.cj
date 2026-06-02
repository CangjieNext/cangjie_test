/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a01_01

  @Level:         1

  @Assertion:   8.2.1(1) Extensions can add functions to the type being extended.

  @Description: Checks that extensions can add functions to the type being extended.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {}

extend A {
    func foo1() { 1 }

    func foo2() { 2 }
}

extend Int64 {
    func foo1() { 1 }

    func foo2() { 2 }
}

struct S {}

extend S {
    func foo1() { 1 }
    
    func foo2() { 2 }
}

main() {
    let x1 = A()
    let x2 = S()
    Assert.equals(1, x1.foo1())
    Assert.equals(2, x1.foo2())
    Assert.equals(1, x2.foo1())
    Assert.equals(2, x2.foo2())
    Assert.equals(1, 3.foo1())
    Assert.equals(2, 5.foo2())
}
