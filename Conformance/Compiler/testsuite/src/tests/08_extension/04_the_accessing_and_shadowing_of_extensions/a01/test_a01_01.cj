/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a01_01

  @Level:         1

  @Assertion:       8.4(1) Extended instance member can use this in the same way as type definitions, and the function 
                    of this remains consistent.

  @Description:     Check that extended type instance member can use "this".

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

type MyType = Int32

extend MyType {
    func double() { this * 2 }

    func info() { this.toString() }
}

class MyClass {
    var myInt64Var: Int64 = 23

    func myBaseFunc0(a: Int64) {
        this.myInt64Var = a
    }

    func myBaseFunc1() {
        this.myInt64Var
    }
}

extend MyClass {
    func myExtendedSetFunc0(a: Int64) {
        this.myInt64Var = a
    }

    func myExtendedSetFunc1(a: Int64) {
        myInt64Var = a
    }

    func myExtendedSetFunc2(a: Int64) {
        myBaseFunc0(a)
    }

    func myExtendedSetFunc3(a: Int64) {
        this.myBaseFunc0(a)
    }

    func myExtendedGetFunc0() {
        this.myBaseFunc1()
    }

    func myExtendedGetFunc1() {
        myBaseFunc1()
    }

    func myExtendedGetFunc2() {
        myInt64Var
    }

    func myExtendedGetFunc3() {
        this.myInt64Var
    }
}

struct MyStruct {
    var myBoolVar: Bool = true

    func myBaseFunc() {
        this.myBoolVar
    }
}

extend MyStruct {
    func myExtendedGetFunc0() {
        this.myBaseFunc()
    }

    func myExtendedGetFunc1() {
        myBaseFunc()
    }

    func myExtendedGetFunc2() {
        myBoolVar
    }

    func myExtendedGetFunc3() {
        this.myBoolVar
    }
}

main() { 
    var myTypeVar: MyType = 12
    Assert.equals(24, myTypeVar.double())
    Assert.equals("12", myTypeVar.info())

    var myClassImpl = MyClass()
    Assert.equals(23, myClassImpl.myBaseFunc1())
    Assert.equals(23, myClassImpl.myExtendedGetFunc0())
    Assert.equals(23, myClassImpl.myExtendedGetFunc1())
    Assert.equals(23, myClassImpl.myExtendedGetFunc2())
    Assert.equals(23, myClassImpl.myExtendedGetFunc3())
    myClassImpl.myBaseFunc0(65)
    Assert.equals(65, myClassImpl.myExtendedGetFunc3())
    myClassImpl.myExtendedSetFunc0(48)
    Assert.equals(48, myClassImpl.myExtendedGetFunc3())
    myClassImpl.myExtendedSetFunc1(12)
    Assert.equals(12, myClassImpl.myExtendedGetFunc2())
    myClassImpl.myExtendedSetFunc2(33)
    Assert.equals(33, myClassImpl.myExtendedGetFunc1())
    myClassImpl.myExtendedSetFunc3(-6)
    Assert.equals(-6, myClassImpl.myExtendedGetFunc0())

    var myStructImpl = MyStruct()
    Assert.equals(true, myStructImpl.myBaseFunc())
    Assert.equals(true, myStructImpl.myExtendedGetFunc0())
    Assert.equals(true, myStructImpl.myExtendedGetFunc1())
    Assert.equals(true, myStructImpl.myExtendedGetFunc2())
    Assert.equals(true, myStructImpl.myExtendedGetFunc3()) 
} 
