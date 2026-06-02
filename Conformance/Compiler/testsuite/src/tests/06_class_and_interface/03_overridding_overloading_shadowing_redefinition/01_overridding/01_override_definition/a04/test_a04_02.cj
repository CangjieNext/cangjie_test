/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a04_02

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(4)
              The return type of the function must be the same as
              or be a subtype of the return type of the overridden function.

  @Description: Check that a class can override instance functions if the return type
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
    public func f1(): Grandparent
    public open func f2(): Grandparent {
        return Grandparent(0)
    }
}

open class B {
    public open func f(): Grandparent {
        return Grandparent(0)
    }
}

sealed abstract class C {
    public open func f(): Grandparent {
        return Grandparent(0)
    }
}

interface I {
    func f1(): Grandparent
    func f2(): Grandparent {
        return Grandparent(0)
    }
}

class T1 <: A {
    public override func f1(): Grandparent {
        return Grandparent(11)
    }
    public override func f2(): Grandparent {
        return Grandparent(12)
    }
}

class T2 <: B {
    public override func f(): Grandparent {
        return Grandparent(21)
    }
}

class T3 <: C {
    public override func f(): Grandparent {
        return Grandparent(31)
    }
}

class T4 <: I {
    public override func f1(): Grandparent {
        return Grandparent(41)
    }
    public override func f2(): Grandparent {
        return Grandparent(42)
    }
}

class T5 <: A {
    public override func f1(): Parent {
        return Parent(51)
    }
    public override func f2(): Parent {
        return Parent(52)
    }
}

class T6 <: B {
    public override func f(): Parent {
        return Parent(61)
    }
}

class T7 <: C {
    public override func f(): Parent {
        return Parent(71)
    }
}

class T8 <: I {
    public override func f1(): Parent {
        return Parent(81)
    }
    public override func f2(): Parent {
        return Parent(82)
    }
}

class T9 <: A {
    public override func f1(): Child {
        return Child(91)
    }
    public override func f2(): Child {
        return Child(92)
    }
}

class T10 <: B {
    public override func f(): Child {
        return Child(101)
    }
}

class T11 <: C {
    public override func f(): Child {
        return Child(111)
    }
}

class T12 <: I {
    public override func f1(): Child {
        return Child(121)
    }
    public override func f2(): Child {
        return Child(122)
    }
}

main() {
    let tst1 = T1().f1()
    Assert.isTrue(tst1 is Grandparent)
    Assert.isFalse(tst1 is Parent)
    Assert.equals(11, tst1.x)

    let tst2 = T1().f2()
    Assert.isTrue(tst2 is Grandparent)
    Assert.isFalse(tst2 is Parent)
    Assert.equals(12, tst2.x)

    let tst3 = T2().f()
    Assert.isTrue(tst3 is Grandparent)
    Assert.isFalse(tst3 is Parent)
    Assert.equals(21, tst3.x)

    let tst4 = T3().f()
    Assert.isTrue(tst4 is Grandparent)
    Assert.isFalse(tst4 is Parent)
    Assert.equals(31, tst4.x)

    let tst5 = T4().f1()
    Assert.isTrue(tst5 is Grandparent)
    Assert.isFalse(tst5 is Parent)
    Assert.equals(41, tst5.x)

    let tst6 = T4().f2()
    Assert.isTrue(tst6 is Grandparent)
    Assert.isFalse(tst6 is Parent)
    Assert.equals(42, tst6.x)

    let tst7 = T5().f1()
    Assert.isTrue(tst7 is Parent)
    Assert.isFalse(tst7 is Child)
    Assert.equals(51, tst7.x)

    let tst8 = T5().f2()
    Assert.isTrue(tst8 is Parent)
    Assert.isFalse(tst8 is Child)
    Assert.equals(52, tst8.x)

    let tst9 = T6().f()
    Assert.isTrue(tst9 is Parent)
    Assert.isFalse(tst9 is Child)
    Assert.equals(61, tst9.x)

    let tst10 = T7().f()
    Assert.isTrue(tst10 is Parent)
    Assert.isFalse(tst10 is Child)
    Assert.equals(71, tst10.x)

    let tst11 = T8().f1()
    Assert.isTrue(tst11 is Parent)
    Assert.isFalse(tst11 is Child)
    Assert.equals(81, tst11.x)

    let tst12 = T8().f2()
    Assert.isTrue(tst12 is Parent)
    Assert.isFalse(tst12 is Child)
    Assert.equals(82, tst12.x)

    let tst13 = T9().f1()
    Assert.isTrue(tst13 is Child)
    Assert.equals(91, tst13.x)

    let tst14 = T9().f2()
    Assert.isTrue(tst14 is Child)
    Assert.equals(92, tst14.x)

    let tst15 = T10().f()
    Assert.isTrue(tst15 is Child)
    Assert.equals(101, tst15.x)

    let tst16 = T11().f()
    Assert.isTrue(tst16 is Child)
    Assert.equals(111, tst16.x)

    let tst17 = T12().f1()
    Assert.isTrue(tst17 is Child)
    Assert.equals(121, tst17.x)

    let tst18 = T12().f2()
    Assert.isTrue(tst18 is Child)
    Assert.equals(122, tst18.x)
}