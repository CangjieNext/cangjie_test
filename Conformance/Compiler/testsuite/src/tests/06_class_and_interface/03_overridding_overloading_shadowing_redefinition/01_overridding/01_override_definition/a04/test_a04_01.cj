/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a04_01

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(4)
              The return type of the function must be the same as
              or be a subtype of the return type of the overridden function.

  @Description: Check that a class can override instance functions if the return type
                is the same as in the overridden function

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class A {
    public func f1(): Unit
    public func f2(): String
    public func f3(): () -> String
    public func f4(): (Rune, Rune, Rune)

    public open func f5() {}
    public open func f6() {
        return ""
    }
    public open func f7() {
        return { => ""}
    }
    public open func f8() {
        return (r'a', r'a', r'a')
    }
}

open class B {
    public open func f1() {}
    public open func f2() {
        return ""
    }
    public open func f3() {
        return { => ""}
    }
    public open func f4() {
        return (r'a', r'a', r'a')
    }
}

sealed abstract class C {
    public open func f1() {}
    public open func f2() {
        return ""
    }
    public open func f3() {
        return { => ""}
    }
    public open func f4() {
        return (r'a', r'a', r'a')
    }
}

interface I {
    func f1(): Unit
    func f2(): String
    func f3(): () -> String
    func f4(): (Rune, Rune, Rune)

    func f5() {}
    func f6() {
        return ""
    }
    func f7() {
        return { => ""}
    }
    func f8() {
        return (r'a', r'a', r'a')
    }
}

class T1 <: A {
    public override func f1() {}
    public override func f2() {
        return "T1f2"
    }
    public override func f3() {
        return { => "T1f3"}
    }
    public override func f4() {
        return (r'T', r'1', r'4')
    }

    public override func f5() {}
    public override func f6() {
        return "T1f6"
    }
    public override func f7() {
        return { => "T1f7"}
    }
    public override func f8() {
        return (r'T', r'1', r'8')
    }
}

class T2 <: B {
    public override func f1() {}
    public override func f2() {
        return "T2f2"
    }
    public override func f3() {
        return { => "T2f3"}
    }
    public override func f4() {
        return (r'T', r'2', r'4')
    }
}

class T3 <: C {
    public override func f1() {}
    public override func f2() {
        return "T3f2"
    }
    public override func f3() {
        return { => "T3f3"}
    }
    public override func f4() {
        return (r'T', r'3', r'4')
    }
}

class T4 <: I {
    public override func f1() {}
    public override func f2() {
        return "T4f2"
    }
    public override func f3() {
        return { => "T4f3"}
    }
    public override func f4() {
        return (r'T', r'4', r'4')
    }

    public override func f5() {}
    public override func f6() {
        return "T4f6"
    }
    public override func f7() {
        return { => "T4f7"}
    }
    public override func f8() {
        return (r'T', r'4', r'8')
    }
}

main() {
    let tst1 = T1()
    Assert.isTrue(tst1.f1() is Unit)
    Assert.equals("T1f2", tst1.f2())
    Assert.equals("T1f3", tst1.f3()())
    Assert.isTrue(tst1.f4() == (r'T', r'1', r'4'))
    Assert.isTrue(tst1.f5() is Unit)
    Assert.equals("T1f6", tst1.f6())
    Assert.equals("T1f7", tst1.f7()())
    Assert.isTrue(tst1.f8() == (r'T', r'1', r'8'))

    let tst2 = T2()
    Assert.isTrue(tst2.f1() is Unit)
    Assert.equals("T2f2", tst2.f2())
    Assert.equals("T2f3", tst2.f3()())
    Assert.isTrue(tst2.f4() == (r'T', r'2', r'4'))

    let tst3 = T3()
    Assert.isTrue(tst3.f1() is Unit)
    Assert.equals("T3f2", tst3.f2())
    Assert.equals("T3f3", tst3.f3()())
    Assert.isTrue(tst3.f4() == (r'T', r'3', r'4'))

    let tst4 = T4()
    Assert.isTrue(tst4.f1() is Unit)
    Assert.equals("T4f2", tst4.f2())
    Assert.equals("T4f3", tst4.f3()())
    Assert.isTrue(tst4.f4() == (r'T', r'4', r'4'))
    Assert.isTrue(tst4.f5() is Unit)
    Assert.equals("T4f6", tst4.f6())
    Assert.equals("T4f7", tst4.f7()())
    Assert.isTrue(tst4.f8() == (r'T', r'4', r'8'))
}