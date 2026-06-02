/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         03_04_02_a01_01

  @Level:         1

   @Assertion:    3.4.2(1) Cangjie provides a number of non-access modifiers to support other rich features.

   @Description:  Checks usage of various non-access modifiers.

   @Mode:         run

   @Negative:     no

   @Structure:    single

   @Comment:
*/

import utils.assert.Assert

open class C1 {
    var currentYear = 0

    init(p: Int64) {
        this.currentYear = p
    }

    public open func f1() {
        return "foo"
    }

    static func f2() {
        return "static foo"
    }
}

class C2 <: C1 {
    var currentMonth = 0

    init(p1: Int64, p2: Int64) {
        super(p1)
        this.currentMonth = p2
    }

    public override func f1() {
        return "overrode foo"
    }

    static redef func f2() {
        return "redefined static foo"
    }

    operator func -(): C2 {
        return C2(currentMonth, currentYear)
    }
}

abstract class C3 {
    public func f3(): Int64
}

class C4 <: C3 {
    public func f3() {
        return 1
    }
}

struct S {
    var defaultVariable1 = 0
    var defaultVariable2 = 0

    mut func doubleBothVar(): Unit {
        defaultVariable1 *= 2
        this.defaultVariable2 *= 2
    }

    init(p1: Int64, p2: Int64) {
        this.defaultVariable1 = p1
        this.defaultVariable2 = p2
    }

    func getSum() {
        return defaultVariable1 + defaultVariable2
    }
}

foreign func hw(): Unit

main() {
    //open, override, redef and static usage
    var obj2 = C2(2023, 5)
    Assert.equals(obj2.currentYear, 2023)
    Assert.equals(obj2.currentMonth, 5)
    Assert.equals(obj2.f1(), "overrode foo")
    Assert.equals(C2.f2(), "redefined static foo")

    // abstract usage
    var obj4 = C4()
    Assert.equals(obj4.f3(), 1)

    // mut usage
    var objS = S(1, 1)
    objS.doubleBothVar()
    Assert.equals(objS.getSum(), 4)

    // operator usage
    var obj2Reversed = -obj2
    Assert.equals(obj2Reversed.currentYear, 5)
    Assert.equals(obj2Reversed.currentMonth, 2023)

    // foreign usage
    unsafe {
        hw()
    }
}
