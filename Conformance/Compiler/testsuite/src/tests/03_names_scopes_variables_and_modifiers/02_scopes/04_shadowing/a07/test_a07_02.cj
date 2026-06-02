/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a07_02

  @Level:         1
  @Assertion:    3.2.4(7) If  f is not overloaded, override may occur.
                 Check that override modifier is optional.
  @Mode:         run
  @Negative:     no

*/

package test

import utils.assert.Assert

interface I1 {
    func f(): Int64 { 0 }
}

interface I2 {
    func g(x: Bool): Bool { x }
}

open class Base <: I1 {
    public open func f(): Int64 { 1 }
}

class C <: Base & I2 {
    override public func g(x: Bool): Bool { !x }
}

main() {
    Assert.equals(1, C().f())
    Assert.isTrue(C().g(false))
}
