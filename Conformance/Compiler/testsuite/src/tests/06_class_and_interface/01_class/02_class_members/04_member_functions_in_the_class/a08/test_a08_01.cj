/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a08_01

  @Level:         1

  @Assertion: 6.1.2.4(8)
              They can only be declared in abstract classes or interfaces.

  @Description: Check that abstract functions can be declared in classes and interfaces

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: 'They' means abastract functions

*/

import utils.assert.Assert

interface I {
    func i1(): Int64
    func i2(x: Int64): Int64
    func i3(x1: Int64, x2: Int64): Int64
    func i4(x1: Int64, x2: Int64, x3: Int64): Int64 
    func i5(x1: Int64, x2: Int64, x3: Int64, x4: Int64): Int64
}

abstract class A {
    public func f1(): Int64
    public func f2(x: Int64): Int64
    public func f3(x1: Int64, x2: Int64): Int64
    public func f4(x1: Int64, x2: Int64, x3: Int64): Int64 
    public func f5(x1: Int64, x2: Int64, x3: Int64, x4: Int64): Int64
}

class Test <: A & I {
    public func i1() {
        return 1
    }
    public func i2(x: Int64) {
        return x
    }
    public func i3(x1: Int64, x2: Int64) {
        return x1 + x2
    }
    public func i4(x1: Int64, x2: Int64, x3: Int64) {
        return x1 + x2 + x3
    }
    public func i5(x1: Int64, x2: Int64, x3: Int64, x4: Int64) {
        return x1 + x2 + x3 + x4
    }
    public func f1() {
        return 6
    }
    public func f2(x: Int64) {
        return x + 2
    }
    public func f3(x1: Int64, x2: Int64) {
        return (x1 + x2) ** 3
    }
    public func f4(x1: Int64, x2: Int64, x3: Int64) {
        return x1 + x2 - x3
    }
    public func f5(x1: Int64, x2: Int64, x3: Int64, x4: Int64) {
        return x1 * x2 * x3 * x4
    }
}

main() {
    let tst = Test()
    Assert.equals(1, tst.i1())
    Assert.equals(2, tst.i2(2))
    Assert.equals(3, tst.i3(1, 2))
    Assert.equals(4, tst.i4(1, 2, 1))
    Assert.equals(5, tst.i5(1, 2, 0, 2))
    Assert.equals(6, tst.f1())
    Assert.equals(7, tst.f2(5))
    Assert.equals(8, tst.f3(1, 1))
    Assert.equals(9, tst.f4(5, 5, 1))
    Assert.equals(10, tst.f5(2, 5, 1, 1))
}