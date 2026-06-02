/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_02_a01_01

  @Level:         1

  @Assertion: 6.3.4.2(1)
              If a subclass redefined a function in the superclass and the function is invoked in the program,
              the compiler selects the version of the function to be executed based on the type.

  @Description: Check that the exact function that is being called is based on the type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006459

  @Comment: This assertion does not fully explain the invocation of redefined functions,
            so the test checks the compiler behavior, not the specification.

*/

import utils.assert.Assert

interface I {
    static func f() {
        return 1
    }

    // Apparently instace function inside an interface never calls the original 'f'
    func verify_instance_func_I() {
        Assert.equals(2, f())
    }
    // What function 'f' is called depends on the type through which this function is called
    static func verify_static_func_I(expected_val: Int64) {
        Assert.equals(expected_val, f())
    }
}

class C1 <: I {
    public redef static func f() {
        return 2
    }

    func verify_instance_func_C1() {
        Assert.equals(2, f())
    }
    static func verify_static_func_C1() {
        Assert.equals(2, f())
    }
}

abstract class A {
    public static func f() {
        return 11
    }

    func verify_instance_func_A(value: Int) {
        Assert.equals(value, f())
    }

    static func verify_static_func_A(value: Int) {
        Assert.equals(value, f())
    }
}

class C2 <: A {
    public redef static func f() {
        return 12
    }

    func verify_instance_func_C2() {
        Assert.equals(12, f())
    }
    
    static func verify_static_func_C2() {
        Assert.equals(12, f())
    }
}


open class B {
    public static func f() {
        return 21
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_B(value: Int) {
        Assert.equals(value, f())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_B(value: Int) {
        Assert.equals(value, f())
    }
}

class C3 <: B {
    public redef static func f() {
        return 22
    }

    func verify_instance_func_C3() {
        Assert.equals(22, f())
    }
    
    static func verify_static_func_C3() {
        Assert.equals(22, f())
    }
}

sealed abstract class C {
    public static func f() {
        return 31
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_C(value: Int) {
        Assert.equals(value, f())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_C(value: Int) {
        Assert.equals(value, f())
    }
}

class C4 <: C {
    public redef static func f() {
        return 32
    }

    func verify_instance_func_C4() {
        Assert.equals(32, f())
    }
    
    static func verify_static_func_C4() {
        Assert.equals(32, f())
    }
}

main() {
    let C1_typeI: I = C1()
    let C1_typeC1: C1 = C1()

    // Call functions through the type name
    Assert.equals(1, I.f())
    Assert.equals(2, C1.f())

    // Call functions through another member function
    C1_typeI.verify_instance_func_I()
    C1_typeC1.verify_instance_func_I()
    C1_typeC1.verify_instance_func_C1()
    I.verify_static_func_I(1)
    C1.verify_static_func_I(2)
    C1.verify_static_func_C1()

    let C2_typeA: A = C2()
    let C2_typeC2: C2 = C2()

    // Call functions through the type name
    Assert.equals(11, A.f())
    Assert.equals(12, C2.f())

    // Call functions through another member function
    C2_typeA.verify_instance_func_A(12)
    C2_typeC2.verify_instance_func_A(12)
    C2_typeC2.verify_instance_func_C2()
    A.verify_static_func_A(11)
    C2.verify_static_func_A(12)
    C2.verify_static_func_C2()

    let B_typeB: B = B()
    let C3_typeB: B = C3()
    let C3_typeC3: C3 = C3()

    // Call functions through the type name
    Assert.equals(21, B.f())
    Assert.equals(22, C3.f())

    // Call functions through another member function
    B_typeB.verify_instance_func_B(21)
    C3_typeB.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_C3()
    B.verify_static_func_B(21)
    C3.verify_static_func_B(22)
    C3.verify_static_func_C3()

    let C4_typeC: C = C4()
    let C4_typeC4: C4 = C4()

    // Call functions through the type name
    Assert.equals(31, C.f())
    Assert.equals(32, C4.f())

    // Call functions through another member function
    C4_typeC.verify_instance_func_C(32)
    C4_typeC4.verify_instance_func_C(32)
    C4_typeC4.verify_instance_func_C4()
    C.verify_static_func_C(31)
    C4.verify_static_func_C(32)
    C4.verify_static_func_C4()
}