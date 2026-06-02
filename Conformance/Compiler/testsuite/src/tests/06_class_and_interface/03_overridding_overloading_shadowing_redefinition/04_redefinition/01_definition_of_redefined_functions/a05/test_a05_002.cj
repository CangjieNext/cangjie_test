/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a05_002

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(5)
              If the redefined function is a generic function,
              the type argument constraints of the redefined function
              are more loose or the same as those of the implemented function.

  @Description: Check that a class can redefine a generic function from another class
                if it defines a generic function with looser or the same constraints

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006400

*/

import utils.assert.Assert

open class A {}
class B <: A {}

open class Tst {
    static func f1<T>() {
        return -1
    }
    static func f2<T>() {
        return -1
    }
    static func f3<T>() where T <: B {
        return -1
    }
    static func f4<T1, T2>() {
        return -1
    }
    static func f5<T1, T2, T3>() {
        return -1
    }
    static func f6<T1, T2, T3>() {
        return -1
    }
    static func f7<T1, T2, T3, T4>() {
        return -1
    }
}

// Implement functions with the same constraints
class Case1 <: Tst {
    public redef static func f1<T>() {
        return 11
    }
    public redef static func f2<T>() {
        return 12
    }
    public redef static func f3<T>() where T <: B {
        return 13
    }
    public redef static func f4<T1, T2>() {
        return 14
    }
    public redef static func f5<T1, T2, T3>() {
        return 15
    }
    public redef static func f6<T1, T2, T3>() {
        return 16
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 17
    }
}

// Implement functions without any constraints
class Case2 <: Tst {
    public redef static func f1<T>() {
        return 21
    }
    public redef static func f2<T>() {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }
    public redef static func f4<T1, T2>() {
        return 24
    }
    public redef static func f5<T1, T2, T3>() {
        return 25
    }
    public redef static func f6<T1, T2, T3>() {
        return 26
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 27
    }
}

// Change all upper bounds to Any
class Case3 <: Tst {
    public redef static func f2<T>() where T <: Any {
        return 32
    }
    public redef static func f3<T>() where T <: Any {
        return 33
    }
    public redef static func f4<T1, T2>() where T1 <: Any {
        return 34
    }
    public redef static func f5<T1, T2, T3>() where T1 <: Any {
        return 35
    }
    public redef static func f6<T1, T2, T3>() where T1 <: Any, T2 <: Any {
        return 36
    }
    public redef static func f7<T1, T2, T3, T4>() where T1 <: Any, T3 <: Any {
        return 37
    }
}

// Of two constraints remove the second one
class Case4 <: Tst {
    public redef static func f6<T1, T2, T3>() {
        return 46
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 47
    }
}

// Of two constraints remove the first one
class Case5 <: Tst {
    public redef static func f6<T1, T2, T3>() {
        return 56
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 57
    }
}

// Merge two constraints into one
class Case6 <: Tst {
    public redef static func f6<T1, T2, T3>() {
        return 66
    }
}


// Make a complex constraint simple by removing the first upper bound 
class Case7 <: Tst {
    public redef static func f5<T1, T2, T3>() {
        return 75
    }
}

// Make a complex constraint simple by removing the second upper bound 
class Case8 <: Tst {
    public redef static func f5<T1, T2, T3>() {
        return 85
    }
}

// Loosen constraints by replacing a class upper type with its direct parent
class Case9 <: Tst {
    public redef static func f3<T>() where T <: A {
        return 93
    }
}

// Loosen constraints by replacing a class upper type with Object
class Case10 <: Tst {
    public redef static func f3<T>() where T <: Object {
        return 103
    }
}

main() {
    Assert.equals(11, Case1.f1<Nothing>())
    Assert.equals(12, Case1.f2<Nothing>())
    Assert.equals(13, Case1.f3<Nothing>())
    Assert.equals(14, Case1.f4<Nothing, Nothing>())
    Assert.equals(15, Case1.f5<Nothing, Nothing, Nothing>())
    Assert.equals(16, Case1.f6<Nothing, Nothing, Nothing>())
    Assert.equals(17, Case1.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(21, Case2.f1<Nothing>())
    Assert.equals(22, Case2.f2<Nothing>())
    Assert.equals(23, Case2.f3<Nothing>())
    Assert.equals(24, Case2.f4<Nothing, Nothing>())
    Assert.equals(25, Case2.f5<Nothing, Nothing, Nothing>())
    Assert.equals(26, Case2.f6<Nothing, Nothing, Nothing>())
    Assert.equals(27, Case2.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(32, Case3.f2<Nothing>())
    Assert.equals(33, Case3.f3<Nothing>())
    Assert.equals(34, Case3.f4<Nothing, Nothing>())
    Assert.equals(35, Case3.f5<Nothing, Nothing, Nothing>())
    Assert.equals(36, Case3.f6<Nothing, Nothing, Nothing>())
    Assert.equals(37, Case3.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(46, Case4.f6<Nothing, Nothing, Nothing>())
    Assert.equals(47, Case4.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(56, Case5.f6<Nothing, Nothing, Nothing>())
    Assert.equals(57, Case5.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(66, Case6.f6<Nothing, Nothing, Nothing>())

    Assert.equals(75, Case7.f5<Nothing, Nothing, Nothing>())

    Assert.equals(85, Case8.f5<Nothing, Nothing, Nothing>())

    Assert.equals(93, Case9.f3<Nothing>())

    Assert.equals(103, Case10.f3<Nothing>())
}