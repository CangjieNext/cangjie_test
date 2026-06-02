/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_02_a01_02

  @Level:         1

  @Assertion: 6.3.1.2(1)
              If a subtype overrides a function in the parent type
              and the function is invoked in the program,
              the compiler selects the version of the function to be executed
              based on the type of the object at run time.

  @Description: Check that the exact function that is being called is based
                on the runtime type of the object of a generic class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

// Interfaces can not be instantiated, and can not be accessed with 'super'
// so the function in this interface can not be called
interface I<T> {
    func f() {
        Assert.isTrue(false)
        return -1
    }

    // The runtime of 'this', 'x' and 'y' is C1<Unit>
    func super_verify_in_class(x: I<Unit>, y: C1<Unit>) {
        Assert.equals(1, x.f())
        Assert.equals(1, y.f())
        Assert.equals(1, this.f())
    }
}

class C1<T> <: I<T> {
    public override func f() {
        return 1
    }

    // The runtime of 'this', 'x' and 'y' is C1<Unit>
    func sub_check_sub(x: I<Unit>, y: C1<Unit>) {
        Assert.equals(1, x.f())
        Assert.equals(1, y.f())
        Assert.equals(1, this.f())
    }
}

// Abstract classes can not be instantiated,
// so the function in this class can only be called through 'super'
abstract class A<T> {
    public open func f() {
        return -1
    }

    // The runtime of 'this', 'x' and 'y' is C2<Unit>
    func super_verify_in_class(x: A<Unit>, y: C2<Unit>) {
        Assert.equals(11, x.f())
        Assert.equals(11, y.f())
        Assert.equals(11, this.f())
    }
}

class C2<T> <: A<T> {
    public override func f() {
        return 11
    }

    // The runtime of 'this', 'x' and 'y' is C2<Unit>
    func sub_check_sub(x: A<Unit>, y: C2<Unit>) {
        Assert.equals(11, x.f())
        Assert.equals(11, y.f())
        Assert.equals(11, this.f())
        Assert.equals(-1, super.f())
    }
}


open class B<T> {
    public open func f() {
        return 21
    }

    // The runtime type of 'this' and 'x' is B<Unit>
    func super_check_super(x: B<Unit>) {
        Assert.equals(21, x.f())
        Assert.equals(21, this.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C3<Unit>
    func super_check_sub(x: B<Unit>, y: C3<Unit>) {
        Assert.equals(22, x.f())
        Assert.equals(22, y.f())
        Assert.equals(22, this.f())
    }
}

class C3<T> <: B<T> {
    public override func f() {
        return 22
    }

    // The runtime type of 'this' is C3<Unit>
    // The runtime type of 'x' is B<Unit>
    func sub_check_super(x: B<Unit>) {
        Assert.equals(21, x.f())
        Assert.equals(22, this.f())
        Assert.equals(21, super.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C3<Unit>
    func sub_check_sub(x: B<Unit>, y: C3<Unit>) {
        Assert.equals(22, x.f())
        Assert.equals(22, y.f())
        Assert.equals(22, this.f())
        Assert.equals(21, super.f())
    }
}

sealed abstract class C<T> {
    public open func f() {
        return 31
    }

    // The runtime type of 'this' and 'x' is C<Unit>
    func super_check_super(x: C<Unit>) {
        Assert.equals(31, x.f())
        Assert.equals(31, this.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C4<Unit>
    func super_check_sub(x: C<Unit>, y: C4<Unit>) {
        Assert.equals(32, x.f())
        Assert.equals(32, y.f())
        Assert.equals(32, this.f())
    }
}

class C4<T> <: C<T> {
    public override func f() {
        return 32
    }

    // The runtime type of 'this' is C4<Unit>
    // The runtime type of 'x' is C<Unit>
    func sub_check_super(x: C<Unit>) {
        Assert.equals(31, x.f())
        Assert.equals(32, this.f())
        Assert.equals(31, super.f())
    }

    // The runtime type of 'this', 'x' and 'y' is C4<Unit>
    func sub_check_sub(x: C<Unit>, y: C4<Unit>) {
        Assert.equals(32, x.f())
        Assert.equals(32, y.f())
        Assert.equals(32, this.f())
        Assert.equals(31, super.f())
    }
}

main() {
    let C1_typeI: I<Unit> = C1<Unit>()
    let C1_typeC1: C1<Unit> = C1<Unit>()

    // Call functions through an instance object
    Assert.equals(1, C1_typeI.f())
    Assert.equals(1, C1_typeC1.f())

    C1_typeI.super_verify_in_class(C1<Unit>(), C1<Unit>())
    C1_typeC1.super_verify_in_class(C1<Unit>(), C1<Unit>())
    C1_typeC1.sub_check_sub(C1<Unit>(), C1<Unit>())

    let C2_typeA: A<Unit> = C2<Unit>()
    let C2_typeC2: C2<Unit> = C2<Unit>()

    // Call functions through an instance object
    Assert.equals(11, C2_typeA.f())
    Assert.equals(11, C2_typeC2.f())

    C2_typeA.super_verify_in_class(C2<Unit>(), C2<Unit>())
    C2_typeC2.super_verify_in_class(C2<Unit>(), C2<Unit>())
    C2_typeC2.sub_check_sub(C2<Unit>(), C2<Unit>())

    let B_typeB: B<Unit> = B<Unit>()
    let C3_typeB: B<Unit> = C3<Unit>()
    let C3_typeC3: C3<Unit> = C3<Unit>()

    // Call functions through an instance object
    Assert.equals(21, B_typeB.f())
    Assert.equals(22, C3_typeB.f())
    Assert.equals(22, C3_typeC3.f())

    B_typeB.super_check_super(B<Unit>())
    C3_typeB.super_check_sub(C3<Unit>(), C3<Unit>())
    C3_typeC3.super_check_sub(C3<Unit>(), C3<Unit>())
    C3_typeC3.sub_check_sub(C3<Unit>(), C3<Unit>())
    C3_typeC3.sub_check_super(B<Unit>())

    let C4_typeC: C<Unit> = C4<Unit>()
    let C4_typeC4: C4<Unit> = C4<Unit>()

    // Call functions through an instance object
    Assert.equals(32, C4_typeC.f())
    Assert.equals(32, C4_typeC4.f())

    C4_typeC.super_check_sub(C4<Unit>(), C4<Unit>())
    C4_typeC4.super_check_sub(C4<Unit>(), C4<Unit>())
    C4_typeC4.sub_check_sub(C4<Unit>(), C4<Unit>())
}