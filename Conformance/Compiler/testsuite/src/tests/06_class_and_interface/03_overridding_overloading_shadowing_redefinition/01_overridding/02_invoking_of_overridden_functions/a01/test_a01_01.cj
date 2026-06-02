/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_02_a01_01

  @Level:         1

  @Assertion: 6.3.1.2(1)
              If a subtype overrides a function in the parent type
              and the function is invoked in the program,
              the compiler selects the version of the function to be executed
              based on the type of the object at run time.

  @Description: Check that the exact function that is being called is based
                on the runtime type of the object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

// Interfaces can not be instantiated, and can not be accessed with 'super'
// so the function in this interface can not be called
interface I {
    func f() {
        Assert.isTrue(false)
        return -1
    }

    // The runtime of 'this', 'x' and 'y' is C1
    func super_verify_in_class(x: I, y: C1) {
        Assert.equals(1, x.f())
        Assert.equals(1, y.f())
        Assert.equals(1, this.f())
    }
}

class C1 <: I {
    public override func f() {
        return 1
    }

    // The runtime of 'this', 'x' and 'y' is C1
    func sub_check_sub(x: I, y: C1) {
        Assert.equals(1, x.f())
        Assert.equals(1, y.f())
        Assert.equals(1, this.f())
    }
}

// Abstract classes can not be instantiated,
// so the function in this class can only be called through 'super'
abstract class A {
    public open func f() {
        return -1
    }

    // The runtime of 'this', 'x' and 'y' is C2
    func super_verify_in_class(x: A, y: C2) {
        Assert.equals(11, x.f())
        Assert.equals(11, y.f())
        Assert.equals(11, this.f())
    }
}

class C2 <: A {
    public override func f() {
        return 11
    }

    // The runtime of 'this', 'x' and 'y' is C2
    func sub_check_sub(x: A, y: C2) {
        Assert.equals(11, x.f())
        Assert.equals(11, y.f())
        Assert.equals(11, this.f())
        Assert.equals(-1, super.f())
    }
}


open class B {
    public open func f() {
        return 21
    }

    // The runtime type of 'this' and 'x' is B
    func super_check_super(x: B) {
        Assert.equals(21, x.f())
        Assert.equals(21, this.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C3
    func super_check_sub(x: B, y: C3) {
        Assert.equals(22, x.f())
        Assert.equals(22, y.f())
        Assert.equals(22, this.f())
    }
}

class C3 <: B {
    public override func f() {
        return 22
    }

    // The runtime type of 'this' is C3
    // The runtime type of 'x' is B
    func sub_check_super(x: B) {
        Assert.equals(21, x.f())
        Assert.equals(22, this.f())
        Assert.equals(21, super.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C3
    func sub_check_sub(x: B, y: C3) {
        Assert.equals(22, x.f())
        Assert.equals(22, y.f())
        Assert.equals(22, this.f())
        Assert.equals(21, super.f())
    }
}

sealed abstract class C {
    public open func f() {
        return 31
    }

    // The runtime type of 'this' and 'x' is C
    func super_check_super(x: C) {
        Assert.equals(31, x.f())
        Assert.equals(31, this.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C4
    func super_check_sub(x: C, y: C4) {
        Assert.equals(32, x.f())
        Assert.equals(32, y.f())
        Assert.equals(32, this.f())
    }
}

class C4 <: C {
    public override func f() {
        return 32
    }

    // The runtime type of 'this' is C4
    // The runtime type of 'x' is C
    func sub_check_super(x: C) {
        Assert.equals(31, x.f())
        Assert.equals(32, this.f())
        Assert.equals(31, super.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C4
    func sub_check_sub(x: C, y: C4) {
        Assert.equals(32, x.f())
        Assert.equals(32, y.f())
        Assert.equals(32, this.f())
        Assert.equals(31, super.f())
    }
}

main() {
    let C1_typeI: I = C1()
    let C1_typeC1: C1 = C1()

    // Call functions through an instance object
    Assert.equals(1, C1_typeI.f())
    Assert.equals(1, C1_typeC1.f())

    C1_typeI.super_verify_in_class(C1(), C1())
    C1_typeC1.super_verify_in_class(C1(), C1())
    C1_typeC1.sub_check_sub(C1(), C1())

    let C2_typeA: A = C2()
    let C2_typeC2: C2 = C2()

    // Call functions through an instance object
    Assert.equals(11, C2_typeA.f())
    Assert.equals(11, C2_typeC2.f())

    C2_typeA.super_verify_in_class(C2(), C2())
    C2_typeC2.super_verify_in_class(C2(), C2())
    C2_typeC2.sub_check_sub(C2(), C2())

    let B_typeB: B = B()
    let C3_typeB: B = C3()
    let C3_typeC3: C3 = C3()

    // Call functions through an instance object
    Assert.equals(21, B_typeB.f())
    Assert.equals(22, C3_typeB.f())
    Assert.equals(22, C3_typeC3.f())

    B_typeB.super_check_super(B())
    C3_typeB.super_check_sub(C3(), C3())
    C3_typeC3.super_check_sub(C3(), C3())
    C3_typeC3.sub_check_sub(C3(), C3())
    C3_typeC3.sub_check_super(B())

    let C4_typeC: C = C4()
    let C4_typeC4: C4 = C4()

    // Call functions through an instance object
    Assert.equals(32, C4_typeC.f())
    Assert.equals(32, C4_typeC4.f())

    C4_typeC.super_check_sub(C4(), C4())
    C4_typeC4.super_check_sub(C4(), C4())
    C4_typeC4.sub_check_sub(C4(), C4())
}