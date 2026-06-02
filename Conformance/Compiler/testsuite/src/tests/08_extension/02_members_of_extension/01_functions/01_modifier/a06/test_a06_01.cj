/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a06_01

  @Level:         1

  @Assertion:   8.2.1.1(6) Functions within extensions support the use of the static modifier.

  @Description: Checks that extension static functions are supported.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {}

extend A {
    static func foo1(): Int64 { 0 }
    
    static public func foo2(): Int64 { 1 }

    static protected func foo3(): Int64 { 2 }
}

struct S {}

extend S {
    static func foo1(): Int64 { 0 }

    static public func foo2(): Int64 { 1 }
}

extend String {
    static func foo1(): Int64 { 0 }

    static public func foo2(): Int64 { 1 }
}

main() {
    Assert.equals(0, A.foo1())
    Assert.equals(1, A.foo2())
    Assert.equals(2, A.foo3())
    Assert.equals(0, S.foo1())
    Assert.equals(1, S.foo2())
    Assert.equals(0, String.foo1())
    Assert.equals(1, String.foo2())
    return 0
}
