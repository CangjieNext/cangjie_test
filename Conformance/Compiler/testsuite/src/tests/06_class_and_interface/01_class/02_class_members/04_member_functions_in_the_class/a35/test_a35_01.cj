/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a35_01

  @Level:         1

  @Assertion: 6.1.2.4(35)
              If there are open-modified members in the class, but the current class is not open-modified,
              then these open-modified members still have no open effect,
              and the compiler will report a warning for this case
              (no warning is required for inherited open members or override members).
              The compiler will report a warning for this case.

  @Description: Check that open functions in inheritable classes and
                inherited open and overridden functions in non-inheritable classes
                do not produce a compiler warning

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006270, 0006084

*/

import utils.assert.Assert

open class Open {
    public open func f1() {}

    public open func f2(x: Int64) {}

    public open func f3() {
        return 1
    }

    public open func f4(x: Int64) {
        return 2
    }

    protected open func f5() {}

    protected open func f6(x: Int64) {}

    protected open func f7() {
        return 3
    }

    protected open func f8(x: Int64) {
        return 4
    }
}

abstract class Abstract {
    public open func f1() {}

    public open func f2(x: Int64) {}

    public open func f3() {
        return 5
    }

    public open func f4(x: Int64) {
        return 6
    }

    protected open func f5() {}

    protected open func f6(x: Int64) {}

    protected open func f7() {
        return 7
    }

    protected open func f8(x: Int64) {
        return 8
    }
}

sealed abstract class Sealed {
    public open func f1() {}

    public open func f2(x: Int64) {}

    public open func f3() {
        return 9
    }

    public open func f4(x: Int64) {
        return 10
    }

    protected open func f5() {}

    protected open func f6(x: Int64) {}

    protected open func f7() {
        return 11
    }

    protected open func f8(x: Int64) {
        return 12
    }
}

class Test1 <: Open {}

class Test2 <: Abstract {}

class Test3 <: Sealed {}

class Test4 <: Open {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 10
    }

    public override func f4(x: Int64) {
        return 20
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 30
    }

    protected override func f8(x: Int64) {
        return 40
    }
}

class Test5 <: Abstract {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 50
    }

    public override func f4(x: Int64) {
        return 60
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 70
    }

    protected override func f8(x: Int64) {
        return 80
    }
}

class Test6 <: Sealed {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 90
    }

    public override func f4(x: Int64) {
        return 100
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 110
    }

    protected override func f8(x: Int64) {
        return 120
    }
}

open class Test7 <: Open {
    public override open func f1() {}

    public override open func f2(x: Int64) {}

    public override open func f3() {
        return 100
    }

    public override open func f4(x: Int64) {
        return 200
    }

    protected override open func f5() {}

    protected override open func f6(x: Int64) {}

    protected override open func f7() {
        return 300
    }

    protected override open func f8(x: Int64) {
        return 400
    }
}

open class Test8 <: Abstract {
    public override open func f1() {}

    public override open func f2(x: Int64) {}

    public override open func f3() {
        return 500
    }

    public override open func f4(x: Int64) {
        return 600
    }

    protected override open func f5() {}

    protected override open func f6(x: Int64) {}

    protected override open func f7() {
        return 700
    }

    protected override open func f8(x: Int64) {
        return 800
    }
}

open class Test9 <: Sealed {
    public override open func f1() {}

    public override open func f2(x: Int64) {}

    public override open func f3() {
        return 900
    }

    public override open func f4(x: Int64) {
        return 1000
    }

    protected override open func f5() {}

    protected override open func f6(x: Int64) {}

    protected override open func f7() {
        return 1100
    }

    protected override open func f8(x: Int64) {
        return 1200
    }
}

main() {
    let case1 = Test1()
    Assert.isTrue(case1.f1() is Unit)
    Assert.isTrue(case1.f2(1) is Unit)
    Assert.equals(1, case1.f3())
    Assert.equals(2, case1.f4(1))
    Assert.isTrue(case1.f5() is Unit)
    Assert.isTrue(case1.f6(1) is Unit)
    Assert.equals(3, case1.f7())
    Assert.equals(4, case1.f8(1))

    let case2 = Test2()
    Assert.isTrue(case2.f1() is Unit)
    Assert.isTrue(case2.f2(1) is Unit)
    Assert.equals(5, case2.f3())
    Assert.equals(6, case2.f4(1))
    Assert.isTrue(case2.f5() is Unit)
    Assert.isTrue(case2.f6(1) is Unit)
    Assert.equals(7, case2.f7())
    Assert.equals(8, case2.f8(1))

    let case3 = Test3()
    Assert.isTrue(case3.f1() is Unit)
    Assert.isTrue(case3.f2(1) is Unit)
    Assert.equals(9, case3.f3())
    Assert.equals(10, case3.f4(1))
    Assert.isTrue(case3.f5() is Unit)
    Assert.isTrue(case3.f6(1) is Unit)
    Assert.equals(11, case3.f7())
    Assert.equals(12, case3.f8(1))

    let case4 = Test4()
    Assert.isTrue(case4.f1() is Unit)
    Assert.isTrue(case4.f2(1) is Unit)
    Assert.equals(10, case4.f3())
    Assert.equals(20, case4.f4(1))
    Assert.isTrue(case4.f5() is Unit)
    Assert.isTrue(case4.f6(1) is Unit)
    Assert.equals(30, case4.f7())
    Assert.equals(40, case4.f8(1))

    let case5 = Test5()
    Assert.isTrue(case5.f1() is Unit)
    Assert.isTrue(case5.f2(1) is Unit)
    Assert.equals(50, case5.f3())
    Assert.equals(60, case5.f4(1))
    Assert.isTrue(case5.f5() is Unit)
    Assert.isTrue(case5.f6(1) is Unit)
    Assert.equals(70, case5.f7())
    Assert.equals(80, case5.f8(1))

    let case6 = Test6()
    Assert.isTrue(case6.f1() is Unit)
    Assert.isTrue(case6.f2(1) is Unit)
    Assert.equals(90, case6.f3())
    Assert.equals(100, case6.f4(1))
    Assert.isTrue(case6.f5() is Unit)
    Assert.isTrue(case6.f6(1) is Unit)
    Assert.equals(110, case6.f7())
    Assert.equals(120, case6.f8(1))

    let case7 = Test7()
    Assert.isTrue(case7.f1() is Unit)
    Assert.isTrue(case7.f2(1) is Unit)
    Assert.equals(100, case7.f3())
    Assert.equals(200, case7.f4(1))
    Assert.isTrue(case7.f5() is Unit)
    Assert.isTrue(case7.f6(1) is Unit)
    Assert.equals(300, case7.f7())
    Assert.equals(400, case7.f8(1))

    let case8 = Test8()
    Assert.isTrue(case8.f1() is Unit)
    Assert.isTrue(case8.f2(1) is Unit)
    Assert.equals(500, case8.f3())
    Assert.equals(600, case8.f4(1))
    Assert.isTrue(case8.f5() is Unit)
    Assert.isTrue(case8.f6(1) is Unit)
    Assert.equals(700, case8.f7())
    Assert.equals(800, case8.f8(1))

    let case9 = Test9()
    Assert.isTrue(case9.f1() is Unit)
    Assert.isTrue(case9.f2(1) is Unit)
    Assert.equals(900, case9.f3())
    Assert.equals(1000, case9.f4(1))
    Assert.isTrue(case9.f5() is Unit)
    Assert.isTrue(case9.f6(1) is Unit)
    Assert.equals(1100, case9.f7())
    Assert.equals(1200, case9.f8(1))
}