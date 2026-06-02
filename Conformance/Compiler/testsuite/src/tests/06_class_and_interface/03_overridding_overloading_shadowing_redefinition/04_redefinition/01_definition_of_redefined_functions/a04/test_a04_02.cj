/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a04_02

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(4)
              The return type of the function must be the same as
              or a subtype of the return type of the redefined function.

  @Description: Check that a class can redefine static functions if the return type
                satisfies the rule from the assertion 

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public open class Grandparent {
    Grandparent(let x: Int64) {}
}
public open class Parent <: Grandparent {
    init(x: Int64) {
        super(x)
    }
}
public class Child <: Parent {
    init(x: Int64) {
        super(x)
    }
}

abstract class A {
    public static func f1(): Grandparent  {
        return Grandparent(0)
    }
    public static func f2<T>(): Grandparent {
        return Grandparent(0)
    }
}

open class B {
    public static func f1(): Grandparent {
        return Grandparent(0)
    }
    public static func f2<T>(): Grandparent {
        return Grandparent(0)
    }
}

sealed abstract class C {
    public static func f1(): Grandparent {
        return Grandparent(0)
    }
    public static func f2<T>(): Grandparent {
        return Grandparent(0)
    }
}

interface I {
    static func f1(): Grandparent
    static func f2(): Grandparent {
        return Grandparent(0)
    }
    static func f3<T>(): Grandparent
    static func f4<T>(): Grandparent {
        return Grandparent(0)
    }
}

class T1 <: A {
    public redef static func f1(): Grandparent {
        return Grandparent(11)
    }
    public redef static func f2<T>(): Grandparent {
        return Grandparent(12)
    }
}

class T2 <: B {
    public redef static func f1(): Grandparent {
        return Grandparent(21)
    }
    public redef static func f2<T>(): Grandparent {
        return Grandparent(22)
    }
}

class T3 <: C {
    public redef static func f1(): Grandparent {
        return Grandparent(31)
    }
    public redef static func f2<T>(): Grandparent {
        return Grandparent(32)
    }
}

class T4 <: I {
    public redef static func f1(): Grandparent {
        return Grandparent(41)
    }
    public redef static func f2(): Grandparent {
        return Grandparent(42)
    }
    public redef static func f3<T>(): Grandparent {
        return Grandparent(43)
    }
    public redef static func f4<T>(): Grandparent {
        return Grandparent(44)
    }
}

class T5 <: A {
    public redef static func f1(): Parent {
        return Parent(51)
    }
    public redef static func f2<T>(): Parent {
        return Parent(52)
    }
}

class T6 <: B {
    public redef static func f1(): Parent {
        return Parent(61)
    }
    public redef static func f2<T>(): Parent {
        return Parent(62)
    }
}

class T7 <: C {
    public redef static func f1(): Parent {
        return Parent(71)
    }
    public redef static func f2<T>(): Parent {
        return Parent(72)
    }
}

class T8 <: I {
    public redef static func f1(): Parent {
        return Parent(81)
    }
    public redef static func f2(): Parent {
        return Parent(82)
    }
    public redef static func f3<T>(): Parent {
        return Parent(83)
    }
    public redef static func f4<T>(): Parent {
        return Parent(84)
    }
}

class T9 <: A {
    public redef static func f1(): Child {
        return Child(91)
    }
    public redef static func f2<T>(): Child {
        return Child(92)
    }
}

class T10 <: B {
    public redef static func f1(): Child {
        return Child(101)
    }
    public redef static func f2<T>(): Child {
        return Child(102)
    }
}

class T11 <: C {
    public redef static func f1(): Child {
        return Child(111)
    }
    public redef static func f2<T>(): Child {
        return Child(112)
    }
}

class T12 <: I {
    public redef static func f1(): Child {
        return Child(121)
    }
    public redef static func f2(): Child {
        return Child(122)
    }
    public redef static func f3<T>(): Child {
        return Child(123)
    }
    public redef static func f4<T>(): Child {
        return Child(124)
    }
}

main() {
    let tst1 = T1.f1()
    Assert.isTrue(tst1 is Grandparent)
    Assert.isFalse(tst1 is Parent)
    Assert.equals(11, tst1.x)

    let tst2 = T1.f2<Unit>()
    Assert.isTrue(tst2 is Grandparent)
    Assert.isFalse(tst2 is Parent)
    Assert.equals(12, tst2.x)

    let tst3 = T2.f1()
    Assert.isTrue(tst3 is Grandparent)
    Assert.isFalse(tst3 is Parent)
    Assert.equals(21, tst3.x)

    let tst4 = T2.f2<Unit>()
    Assert.isTrue(tst4 is Grandparent)
    Assert.isFalse(tst4 is Parent)
    Assert.equals(22, tst4.x)

    let tst5 = T3.f1()
    Assert.isTrue(tst5 is Grandparent)
    Assert.isFalse(tst5 is Parent)
    Assert.equals(31, tst5.x)

    let tst6 = T3.f2<Unit>()
    Assert.isTrue(tst6 is Grandparent)
    Assert.isFalse(tst6 is Parent)
    Assert.equals(32, tst6.x)

    let tst7 = T4.f1()
    Assert.isTrue(tst7 is Grandparent)
    Assert.isFalse(tst7 is Parent)
    Assert.equals(41, tst7.x)

    let tst8 = T4.f2()
    Assert.isTrue(tst8 is Grandparent)
    Assert.isFalse(tst8 is Parent)
    Assert.equals(42, tst8.x)

    let tst9 = T4.f3<Unit>()
    Assert.isTrue(tst9 is Grandparent)
    Assert.isFalse(tst9 is Parent)
    Assert.equals(43, tst9.x)

    let tst10 = T4.f4<Unit>()
    Assert.isTrue(tst10 is Grandparent)
    Assert.isFalse(tst10 is Parent)
    Assert.equals(44, tst10.x)

    let tst11 = T5.f1()
    Assert.isTrue(tst11 is Parent)
    Assert.isFalse(tst11 is Child)
    Assert.equals(51, tst11.x)

    let tst12 = T5.f2<Unit>()
    Assert.isTrue(tst12 is Parent)
    Assert.isFalse(tst12 is Child)
    Assert.equals(52, tst12.x)

    let tst13 = T6.f1()
    Assert.isTrue(tst13 is Parent)
    Assert.isFalse(tst13 is Child)
    Assert.equals(61, tst13.x)

    let tst14 = T6.f2<Unit>()
    Assert.isTrue(tst14 is Parent)
    Assert.isFalse(tst14 is Child)
    Assert.equals(62, tst14.x)

    let tst15 = T7.f1()
    Assert.isTrue(tst15 is Parent)
    Assert.isFalse(tst15 is Child)
    Assert.equals(71, tst15.x)

    let tst16 = T7.f2<Unit>()
    Assert.isTrue(tst16 is Parent)
    Assert.isFalse(tst16 is Child)
    Assert.equals(72, tst16.x)

    let tst17 = T8.f1()
    Assert.isTrue(tst17 is Parent)
    Assert.isFalse(tst17 is Child)
    Assert.equals(81, tst17.x)

    let tst18 = T8.f2()
    Assert.isTrue(tst18 is Parent)
    Assert.isFalse(tst18 is Child)
    Assert.equals(82, tst18.x)

    let tst19 = T8.f3<Unit>()
    Assert.isTrue(tst19 is Parent)
    Assert.isFalse(tst19 is Child)
    Assert.equals(83, tst19.x)

    let tst20 = T8.f4<Unit>()
    Assert.isTrue(tst20 is Parent)
    Assert.isFalse(tst20 is Child)
    Assert.equals(84, tst20.x)

    let tst21 = T9.f1()
    Assert.isTrue(tst21 is Child)
    Assert.equals(91, tst21.x)

    let tst22 = T9.f2<Unit>()
    Assert.isTrue(tst22 is Child)
    Assert.equals(92, tst22.x)

    let tst23 = T10.f1()
    Assert.isTrue(tst23 is Child)
    Assert.equals(101, tst23.x)

    let tst24 = T10.f2<Unit>()
    Assert.isTrue(tst24 is Child)
    Assert.equals(102, tst24.x)

    let tst25 = T11.f1()
    Assert.isTrue(tst25 is Child)
    Assert.equals(111, tst25.x)

    let tst26 = T11.f2<Unit>()
    Assert.isTrue(tst26 is Child)
    Assert.equals(112, tst26.x)

    let tst27 = T12.f1()
    Assert.isTrue(tst27 is Child)
    Assert.equals(121, tst27.x)

    let tst28 = T12.f2()
    Assert.isTrue(tst28 is Child)
    Assert.equals(122, tst28.x)

    let tst29 = T12.f3<Unit>()
    Assert.isTrue(tst29 is Child)
    Assert.equals(123, tst29.x)

    let tst30 = T12.f4<Unit>()
    Assert.isTrue(tst30 is Child)
    Assert.equals(124, tst30.x)
}