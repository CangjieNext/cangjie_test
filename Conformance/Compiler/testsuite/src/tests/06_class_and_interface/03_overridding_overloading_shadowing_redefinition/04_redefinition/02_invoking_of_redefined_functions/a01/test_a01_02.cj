/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_02_a01_02

  @Level:         1

  @Assertion: 6.3.4.2(1)
              If a subclass redefined a function in the superclass and the function is invoked in the program,
              the compiler selects the version of the function to be executed based on the type.

  @Description: Check that the exact generic function that is being called is based on the type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006459

  @Comment: This assertion does not fully explain the invocation of redefined functions,
            so the test checks the compiler behavior, not the specification.

*/

import utils.assert.Assert

interface I {
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

class C1 <: I {
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

abstract class A {
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

class C2 <: A {
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


open class B {
    public static func f<T>() {
        return 21
    }

    func verify_instance_func_B(value: Int) {
        Assert.equals(value, f<Unit>())
    }

    static func verify_static_func_B(value: Int) {
        Assert.equals(value, f<Unit>())
    }
}

class C3 <: B {
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

sealed abstract class C {
    public static func f<T>() {
        return 31
    }

    func verify_instance_func_C(value: Int) {
        Assert.equals(value, f<Unit>())
    }

    static func verify_static_func_C(value: Int) {
        Assert.equals(value, f<Unit>())
    }
}

class C4 <: C {
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
    let C2_typeA: A = C2()
    let C2_typeC2: C2 = C2()

    // Call functions through the type name
    Assert.equals(11, A.f<Unit>())

    // Call functions through another member function
    C2_typeA.verify_instance_func_A()
}
