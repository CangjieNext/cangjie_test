/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a01_01

  @Level:         1

  @Assertion:       8.5(1) If the type being extended is class, then the extended members are inherited by the 
                    subclasses.

  @Description:     Check that members defined in class extension are inherited by subclasses.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

open class MyOpenClass0 {
    var myVar: Int64 = 10
}

open class MyOpenClass1 {}

extend MyOpenClass1 {
    static func myStaticFunc() {
        "AAA"
    }
}

extend MyOpenClass0 {
    func myFunc0() {
        myVar
    }

    func myFunc1(a: Int64) { 
        myVar = a
    }

    protected func myProtectedFunc(a: Int64) {
        a + myVar
    }
}

class MyClass0 <: MyOpenClass0 {
    func g() {
        myFunc0() 
    }

    func f(a: Int64) {
        myFunc1(a) 
    }

    func myCallProtectedFunc(a: Int64) {
        this.myProtectedFunc(a)
    }
}

class MyClass1 <: MyOpenClass1 {}

main() {
    var myOpenClass0Impl = MyOpenClass0()
    Assert.equals(10, myOpenClass0Impl.myFunc0())
    myOpenClass0Impl.myFunc1(66)
    Assert.equals(66, myOpenClass0Impl.myFunc0())

    var myClass0Impl = MyClass0()
    Assert.equals(10, myClass0Impl.g())
    myClass0Impl.f(66)
    Assert.equals(66, myClass0Impl.g())
    Assert.equals(72, myClass0Impl.myCallProtectedFunc(6))

    Assert.equals("AAA", MyOpenClass1.myStaticFunc())
    Assert.equals("AAA", MyClass1.myStaticFunc())
}
