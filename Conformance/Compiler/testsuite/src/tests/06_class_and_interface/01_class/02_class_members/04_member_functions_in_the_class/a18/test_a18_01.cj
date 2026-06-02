/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a18_01

  @Level:         1

  @Assertion: 6.1.2.4(18)
              Static member functions can reference other static member functions or static member variables

  @Description: Check that static class members are accessible inside static functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

open class Parent {
    static var parent_var = 1
    static let parent_let = 2

    static func parent_f() {
        return 3
    }
    static func parent_f_g<T>() {
        return 4
    }

    static mut prop parent_mut_p: Int64 {
        get() {
            5
        }
        set(v){}
    }
    static prop parent_p: Int64 {
        get() {
            6
        }
    }
}

class Test <: Parent {
    static var child_var = 7
    static let child_let = 8

    static func child_f() {
        return 9
    }
    static func child_f_g<T>() {
        return 10
    }

    static mut prop child_mut_p: Int64 {
        get() {
            11
        }
        set(v){}
    }
    static prop child_p: Int64 {
        get() {
            12
        }
    }

    static func test() {
        // Directly by name
        Assert.equals(1, parent_var)
        Assert.equals(2, parent_let)
        Assert.equals(3, parent_f())
        Assert.equals(4, parent_f_g<Rune>())
        Assert.equals(5, parent_mut_p)
        Assert.equals(6, parent_p)
        Assert.equals(7, child_var)
        Assert.equals(8, child_let)
        Assert.equals(9, child_f())
        Assert.equals(10, child_f_g<Bool>())
        Assert.equals(11, child_mut_p)
        Assert.equals(12, child_p)
        // Referencing functions by name as objects
        Assert.isTrue(parent_f is () -> Int64)
        Assert.isTrue(parent_f_g<Unit> is () -> Int64)
        Assert.isTrue(child_f is () -> Int64)
        Assert.isTrue(child_f_g<Unit> is () -> Int64)

        // Through the class name
        Assert.equals(1, Test.parent_var)
        Assert.equals(2, Test.parent_let)
        Assert.equals(3, Test.parent_f())
        Assert.equals(4, Test.parent_f_g<Rune>())
        Assert.equals(5, Test.parent_mut_p)
        Assert.equals(6, Test.parent_p)
        Assert.equals(7, Test.child_var)
        Assert.equals(8, Test.child_let)
        Assert.equals(9, Test.child_f())
        Assert.equals(10, Test.child_f_g<Bool>())
        Assert.equals(11, Test.child_mut_p)
        Assert.equals(12, Test.child_p)
        // Referencing functions by name as objects
        Assert.isTrue(Test.parent_f is () -> Int64)
        Assert.isTrue(Test.parent_f_g<Unit> is () -> Int64)
        Assert.isTrue(Test.child_f is () -> Int64)
        Assert.isTrue(Test.child_f_g<Unit> is () -> Int64)

        // Through parent class name for inherited members
        Assert.equals(1, Parent.parent_var)
        Assert.equals(2, Parent.parent_let)
        Assert.equals(3, Parent.parent_f())
        Assert.equals(4, Parent.parent_f_g<Rune>())
        Assert.equals(5, Parent.parent_mut_p)
        Assert.equals(6, Parent.parent_p)
        // Referencing functions by name as objects
        Assert.isTrue(Parent.parent_f is () -> Int64)
        Assert.isTrue(Parent.parent_f_g<Unit> is () -> Int64)
    }

    static func test_generic<T>() {
        // Directly by name
        Assert.equals(1, parent_var)
        Assert.equals(2, parent_let)
        Assert.equals(3, parent_f())
        Assert.equals(4, parent_f_g<Rune>())
        Assert.equals(5, parent_mut_p)
        Assert.equals(6, parent_p)
        Assert.equals(7, child_var)
        Assert.equals(8, child_let)
        Assert.equals(9, child_f())
        Assert.equals(10, child_f_g<Bool>())
        Assert.equals(11, child_mut_p)
        Assert.equals(12, child_p)
        // Referencing functions by name as objects
        Assert.isTrue(parent_f is () -> Int64)
        Assert.isTrue(parent_f_g<Unit> is () -> Int64)
        Assert.isTrue(child_f is () -> Int64)
        Assert.isTrue(child_f_g<Unit> is () -> Int64)

        // Through the class name
        Assert.equals(1, Test.parent_var)
        Assert.equals(2, Test.parent_let)
        Assert.equals(3, Test.parent_f())
        Assert.equals(4, Test.parent_f_g<Rune>())
        Assert.equals(5, Test.parent_mut_p)
        Assert.equals(6, Test.parent_p)
        Assert.equals(7, Test.child_var)
        Assert.equals(8, Test.child_let)
        Assert.equals(9, Test.child_f())
        Assert.equals(10, Test.child_f_g<Bool>())
        Assert.equals(11, Test.child_mut_p)
        Assert.equals(12, Test.child_p)
        // Referencing functions by name as objects
        Assert.isTrue(Test.parent_f is () -> Int64)
        Assert.isTrue(Test.parent_f_g<Unit> is () -> Int64)
        Assert.isTrue(Test.child_f is () -> Int64)
        Assert.isTrue(Test.child_f_g<Unit> is () -> Int64)

        // Through parent class name for inherited members
        Assert.equals(1, Parent.parent_var)
        Assert.equals(2, Parent.parent_let)
        Assert.equals(3, Parent.parent_f())
        Assert.equals(4, Parent.parent_f_g<Rune>())
        Assert.equals(5, Parent.parent_mut_p)
        Assert.equals(6, Parent.parent_p)
        // Referencing functions by name as objects
        Assert.isTrue(Parent.parent_f is () -> Int64)
        Assert.isTrue(Parent.parent_f_g<Unit> is () -> Int64)
    }
}

main() {
    Test.test()
    Test.test_generic<Float32>()
}