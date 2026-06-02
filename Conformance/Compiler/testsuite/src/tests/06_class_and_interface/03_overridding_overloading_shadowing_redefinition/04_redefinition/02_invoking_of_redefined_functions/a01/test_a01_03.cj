/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_02_a01_03

  @Level:         1

  @Assertion: 6.3.4.2(1)
              If a subclass redefined a function in the superclass and the function is invoked in the program,
              the compiler selects the version of the function to be executed based on the type.

  @Description: Check that the exact function that is being called is based on the type.
                The case for generic types.

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006459

  @Comment: This assertion does not fully explain the invocation of redefined functions,
            so the test checks the compiler behavior, not the specification.

*/

import utils.assert.Assert

interface I<U> {
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

class C1<U> <: I<U> {
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

abstract class A<U> {
    public static func f() {
        return 11
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_A() {
        Assert.equals(12, f())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_A(value: Int) {
        Assert.equals(value, f())
    }
}

class C2<U> <: A<U> {
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


open class B<U> {
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

class C3<U> <: B<U> {
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

sealed abstract class C<U> {
    public static func f() {
        return 31
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_C() {
        Assert.equals(32, f())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_C(value: Int) {
        Assert.equals(value, f())
    }
}

class C4<U> <: C<U> {
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
    let C1_typeI: I<Bool> = C1<Bool>()
    let C1_typeC1: C1<Bool> = C1<Bool>()

    // Call functions through the type name
    Assert.equals(1, I<Bool>.f())
    Assert.equals(2, C1<Bool>.f())

    // Call functions through another member function
    C1_typeI.verify_instance_func_I()
    C1_typeC1.verify_instance_func_I()
    C1_typeC1.verify_instance_func_C1()
    I<Bool>.verify_static_func_I(1)
    C1<Bool>.verify_static_func_I(2)
    C1<Bool>.verify_static_func_C1()

    let C2_typeA: A<Bool> = C2<Bool>()
    let C2_typeC2: C2<Bool> = C2<Bool>()

    // Call functions through the type name
    Assert.equals(11, A<Bool>.f())
    Assert.equals(12, C2<Bool>.f())

    // Call functions through another member function
    C2_typeA.verify_instance_func_A()
    C2_typeC2.verify_instance_func_A()
    C2_typeC2.verify_instance_func_C2()
    A<Bool>.verify_static_func_A(11)
    C2<Bool>.verify_static_func_A(12)
    C2<Bool>.verify_static_func_C2()

    let B_typeB: B<Bool> = B<Bool>()
    let C3_typeB: B<Bool> = C3<Bool>()
    let C3_typeC3: C3<Bool> = C3<Bool>()

    // Call functions through the type name
    Assert.equals(21, B<Bool>.f())
    Assert.equals(22, C3<Bool>.f())

    // Call functions through another member function
    B_typeB.verify_instance_func_B(21)
    C3_typeB.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_C3()
    B<Bool>.verify_static_func_B(21)
    C3<Bool>.verify_static_func_B(22)
    C3<Bool>.verify_static_func_C3()

    let C4_typeC: C<Bool> = C4<Bool>()
    let C4_typeC4: C4<Bool> = C4<Bool>()

    // Call functions through the type name
    Assert.equals(31, C<Bool>.f())
    Assert.equals(32, C4<Bool>.f())

    // Call functions through another member function
    C4_typeC.verify_instance_func_C()
    C4_typeC4.verify_instance_func_C()
    C4_typeC4.verify_instance_func_C4()
    C<Bool>.verify_static_func_C(31)
    C4<Bool>.verify_static_func_C(32)
    C4<Bool>.verify_static_func_C4()
}
