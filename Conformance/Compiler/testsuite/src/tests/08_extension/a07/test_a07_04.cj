/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a07_04

  @Level:         1

  @Assertion:   8(7) Features that can be added include: Implementing Interfaces.

  @Description: Checks that implementing interfaces can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I1 {
    func f(): Int64
}

interface I2 {
    func f(a: Int32): Int64
}

extend Int64 <: I1 & I2 {
    public func f(): Int64 { 111 }

    public func f(a: Int32): Int64 { Int64(a + 1) }
}

main() {
    Assert.equals(111, 112.f())
    Assert.equals(9, 38.f(8))
}
