/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a36_01

  @Level:         1

  @Assertion: 6.1.2.4(36)
              Functions modified by open must be modified by public or protected

  @Description: Check that open functions modified by public or protected do not cause errors

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 1
    }

    public func f4(x: Int64) {
        return 2
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 3
    }

    protected func f8(x: Int64) {
        return 4
    }
}

abstract class Abstract {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 5
    }

    public func f4(x: Int64) {
        return 6
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 7
    }

    protected func f8(x: Int64) {
        return 8
    }
}

class Real <: Abstract {}

sealed abstract class Sealed {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 9
    }

    public func f4(x: Int64) {
        return 10
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 11
    }

    protected func f8(x: Int64) {
        return 12
    }
}

main() {
    let case1 = Open()
    Assert.isTrue(case1.f1() is Unit)
    Assert.isTrue(case1.f2(1) is Unit)
    Assert.equals(1, case1.f3())
    Assert.equals(2, case1.f4(1))
    Assert.isTrue(case1.f5() is Unit)
    Assert.isTrue(case1.f6(1) is Unit)
    Assert.equals(3, case1.f7())
    Assert.equals(4, case1.f8(1))

    let case2 = Real()
    Assert.isTrue(case2.f1() is Unit)
    Assert.isTrue(case2.f2(1) is Unit)
    Assert.equals(5, case2.f3())
    Assert.equals(6, case2.f4(1))
    Assert.isTrue(case2.f5() is Unit)
    Assert.isTrue(case2.f6(1) is Unit)
    Assert.equals(7, case2.f7())
    Assert.equals(8, case2.f8(1))
}