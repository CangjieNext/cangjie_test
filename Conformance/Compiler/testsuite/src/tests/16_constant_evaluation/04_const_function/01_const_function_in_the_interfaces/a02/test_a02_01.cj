
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_01_a02_01

  @Level:         1

  @Assertion:   16.4.1(2) 2.non-const functions in the interface, the implementation type using const or non-const
                functions are considered to implement the interface.
  @Description: Check that non-const functions in the interface can be implemented by either const or non-const
                functions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

interface I1 {
    func f(): Int64
}

class C1 <: I1 {
    public const func f() { 1 }

    const init() { }
}

class C2 <: I1 {
    public func f() { 2 }

    const init() { }
}

interface I2 {
    static func f(): Int64
}

class C3 <: I2 {
    public static const func f() { 3 }
}

class C4 <: I2 {
    public static func f() { 4 }
}

main() {
    Assert.equals(1, C1().f())
    Assert.equals(2, C2().f())
    Assert.equals(3, C3.f())
    Assert.equals(4, C4.f())
}
