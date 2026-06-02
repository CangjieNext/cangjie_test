/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a07_01

  @Level:         1
  @Assertion:    3.2.4(7) If  f is not overloaded, override may occur.
                 Check that override modifier is optional.
  @Mode:         run
  @Negative:     no

*/

package test

import utils.assert.Assert

open class Base {
    open public func f(): Int64 { 0 }
    open public func g(x: Bool): Bool { x }
}

class C <: Base {
    public func f(): Int64 { 1 }
    override public func g(x: Bool): Bool { !x }
}

main() {
    Assert.equals(1, C().f())
    Assert.isTrue(C().g(false))
    Assert.isFalse(C().g(true))
}
