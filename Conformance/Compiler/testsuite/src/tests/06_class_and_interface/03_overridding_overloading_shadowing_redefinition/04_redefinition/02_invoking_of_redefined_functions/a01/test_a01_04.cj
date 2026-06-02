/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_02_a01_04

  @Level:         1

  @Assertion: 6.3.4.2(1)
              If a subclass redefined a function in the superclass and the function is invoked in the program,
              the compiler selects the version of the function to be executed based on the type.

  @Description: Check that the exact generic function that is being called is based on the type.
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
    static func f<T>() {
        return 1
    }

    // Apparently instace function inside an interface never calls the original 'f'
    func verify_instance_func_I() {
        Assert.equals(2, f<Unit>())
    }
    // What function 'f' is called depends on the type through which this function is called
    static func verify_static_func_I(expected_val: Int64) {
        Assert.equals(expected_val, f<Unit>())
    }
}

class C1<U> <: I<U> {
    public redef static func f<T>() {
        return 2
    }

    func verify_instance_func_C1() {
        Assert.equals(2, f<Unit>())
    }
    static func verify_static_func_C1() {
        Assert.equals(2, f<Unit>())
    }
}

abstract class A<U> {
    public static func f<T>() {
        return 11
    }

    func verify_instance_func_A() {
        Assert.equals(12, f<Unit>())
    }

    static func verify_static_func_A(value: Int) {
        Assert.equals(value, f<Unit>())
    }
}

class C2<U> <: A<U> {
    public redef static func f<T>() {
        return 12
    }

    func verify_instance_func_C2() {
        Assert.equals(12, f<Unit>())
    }
    
    static func verify_static_func_C2() {
        Assert.equals(12, f<Unit>())
    }
}


open class B<U> {
    public static func f<T>() {
        return 21
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_B(value: Int) {
        Assert.equals(value, f<Unit>())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_B(value: Int) {
        Assert.equals(value, f<Unit>())
    }
}

class C3<U> <: B<U> {
    public redef static func f<T>() {
        return 22
    }

    func verify_instance_func_C3() {
        Assert.equals(22, f<Unit>())
    }
    
    static func verify_static_func_C3() {
        Assert.equals(22, f<Unit>())
    }
}

sealed abstract class C<U> {
    public static func f<T>() {
        return 31
    }

    // Unlike in interfaces, instance function will always call the original 'f'
    func verify_instance_func_C() {
        Assert.equals(32, f<Unit>())
    }

    // Static funtions of classes will also always call the original 'f'
    static func verify_static_func_C(value: Int) {
        Assert.equals(value, f<Unit>())
    }
}

class C4<U> <: C<U> {
    public redef static func f<T>() {
        return 32
    }

    func verify_instance_func_C4() {
        Assert.equals(32, f<Unit>())
    }
    
    static func verify_static_func_C4() {
        Assert.equals(32, f<Unit>())
    }
}

main() {
    let C1_typeI: I<Rune> = C1<Rune>()
    let C1_typeC1: C1<Rune> = C1<Rune>()

    // Call functions through the type name
    Assert.equals(1, I<Rune>.f<Unit>())
    Assert.equals(2, C1<Rune>.f<Unit>())

    // Call functions through another member function
    C1_typeI.verify_instance_func_I()
    C1_typeC1.verify_instance_func_I()
    C1_typeC1.verify_instance_func_C1()
    I<Rune>.verify_static_func_I(1)
    C1<Rune>.verify_static_func_I(2)
    C1<Rune>.verify_static_func_C1()

    let C2_typeA: A<Rune> = C2<Rune>()
    let C2_typeC2: C2<Rune> = C2<Rune>()

    // Call functions through the type name
    Assert.equals(11, A<Rune>.f<Unit>())
    Assert.equals(12, C2<Rune>.f<Unit>())

    // Call functions through another member function
    C2_typeA.verify_instance_func_A()
    C2_typeC2.verify_instance_func_A()
    C2_typeC2.verify_instance_func_C2()
    A<Rune>.verify_static_func_A(11)
    C2<Rune>.verify_static_func_A(12)
    C2<Rune>.verify_static_func_C2()

    let B_typeB: B<Rune> = B<Rune>()
    let C3_typeB: B<Rune> = C3<Rune>()
    let C3_typeC3: C3<Rune> = C3<Rune>()

    // Call functions through the type name
    Assert.equals(21, B<Rune>.f<Unit>())
    Assert.equals(22, C3<Rune>.f<Unit>())

    // Call functions through another member function
    B_typeB.verify_instance_func_B(21)
    C3_typeB.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_B(22)
    C3_typeC3.verify_instance_func_C3()
    B<Rune>.verify_static_func_B(21)
    C3<Rune>.verify_static_func_B(22)
    C3<Rune>.verify_static_func_C3()

    let C4_typeC: C<Rune> = C4<Rune>()
    let C4_typeC4: C4<Rune> = C4<Rune>()

    // Call functions through the type name
    Assert.equals(31, C<Rune>.f<Unit>())
    Assert.equals(32, C4<Rune>.f<Unit>())

    // Call functions through another member function
    C4_typeC.verify_instance_func_C()
    C4_typeC4.verify_instance_func_C()
    C4_typeC4.verify_instance_func_C4()
    C<Rune>.verify_static_func_C(31)
    C4<Rune>.verify_static_func_C(32)
    C4<Rune>.verify_static_func_C4()
}
