/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a04_01

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(4)
              The return type of the function must be the same as
              or a subtype of the return type of the redefined function.

  @Description: Check that a class can redefine static functions if the return type
                is the same as in the redefined function

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class A {
    public static func f1() {}
    public static func f2() {
        return ""
    }
    public static func f3<T>() {
        return { => ""}
    }
    public static func f4<T>() {
        return (r'a', r'a', r'a')
    }
}

open class B {
    public static func f1() {}
    public static func f2() {
        return ""
    }
    public static func f3<T>() {
        return { => ""}
    }
    public static func f4<T>() {
        return (r'a', r'a', r'a')
    }
}

sealed abstract class C {
    public static func f1() {}
    public static func f2() {
        return ""
    }
    public static func f3<T>() {
        return { => ""}
    }
    public static func f4<T>() {
        return (r'a', r'a', r'a')
    }
}

interface I {
    static func f1(): Unit
    static func f2(): String
    static func f3<T>(): () -> String
    static func f4<T>(): (Rune, Rune, Rune)

    static func f5() {}
    static func f6() {
        return ""
    }
    static func f7<T>() {
        return { => ""}
    }
    static func f8<T>() {
        return (r'a', r'a', r'a')
    }
}

class T1 <: A {
    public redef static func f1() {}
    public redef static func f2() {
        return "T1f2"
    }
    public redef static func f3<T>() {
        return { => "T1f3"}
    }
    public redef static func f4<T>() {
        return (r'T', r'1', r'4')
    }
}

class T2 <: B {
    public redef static func f1() {}
    public redef static func f2() {
        return "T2f2"
    }
    public redef static func f3<T>() {
        return { => "T2f3"}
    }
    public redef static func f4<T>() {
        return (r'T', r'2', r'4')
    }
}

class T3 <: C {
    public redef static func f1() {}
    public redef static func f2() {
        return "T3f2"
    }
    public redef static func f3<T>() {
        return { => "T3f3"}
    }
    public redef static func f4<T>() {
        return (r'T', r'3', r'4')
    }
}

class T4 <: I {
    public redef static func f1() {}
    public redef static func f2() {
        return "T4f2"
    }
    public redef static func f3<T>() {
        return { => "T4f3"}
    }
    public redef static func f4<T>() {
        return (r'T', r'4', r'4')
    }

    public redef static func f5() {}
    public redef static func f6() {
        return "T4f6"
    }
    public redef static func f7<T>() {
        return { => "T4f7"}
    }
    public redef static func f8<T>() {
        return (r'T', r'4', r'8')
    }
}

main() {
    Assert.isTrue(T1.f1() is Unit)
    Assert.equals("T1f2", T1.f2())
    Assert.equals("T1f3", T1.f3<Unit>()())
    Assert.isTrue(T1.f4<Unit>() == (r'T', r'1', r'4'))

    Assert.isTrue(T2.f1() is Unit)
    Assert.equals("T2f2", T2.f2())
    Assert.equals("T2f3", T2.f3<Unit>()())
    Assert.isTrue(T2.f4<Unit>() == (r'T', r'2', r'4'))

    Assert.isTrue(T3.f1() is Unit)
    Assert.equals("T3f2", T3.f2())
    Assert.equals("T3f3", T3.f3<Unit>()())
    Assert.isTrue(T3.f4<Unit>() == (r'T', r'3', r'4'))

    Assert.isTrue(T4.f1() is Unit)
    Assert.equals("T4f2", T4.f2())
    Assert.equals("T4f3", T4.f3<Unit>()())
    Assert.isTrue(T4.f4<Unit>() == (r'T', r'4', r'4'))
    Assert.isTrue(T4.f5() is Unit)
    Assert.equals("T4f6", T4.f6())
    Assert.equals("T4f7", T4.f7<Unit>()())
    Assert.isTrue(T4.f8<Unit>() == (r'T', r'4', r'8'))
}