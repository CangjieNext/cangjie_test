/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a03_01

  @Level:         1

  @Assertion:       8.5(3) Note that if a member is extended in the parent class, it cannot be defined again in the 
                    child class with the same name due to inheritance rules, and it cannot be overridden or 
                    reimplemented(allow function overloading).

  @Description:     Check that members defined in class extension can be overloaded in subclass.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

open class MyOpenClass {
    var myVar: Int64 = 10
}

extend MyOpenClass {
    func myFunc0() {
        myVar
    }

    func myFunc1(a: String, b: Rune) {
        "${b} ${a}"
    }
}

class MyClass <: MyOpenClass {
    func myFunc0(a: Int64) {
        a + myVar
    }

    func myFunc1(a: Bool, b: Int32) {
        "${b} ${a}"
    }
}

main() {
    var myOpenClassImpl = MyOpenClass()
    Assert.equals(10, myOpenClassImpl.myFunc0())
    Assert.equals("V AAA", myOpenClassImpl.myFunc1("AAA", r'V'))

    var myClassImpl = MyClass()
    Assert.equals(10, myClassImpl.myFunc0())
    Assert.equals(22, myClassImpl.myFunc0(12))
    Assert.equals("V AAA", myClassImpl.myFunc1("AAA", r'V'))
    Assert.equals("6 true", myClassImpl.myFunc1(true, 6))

}
