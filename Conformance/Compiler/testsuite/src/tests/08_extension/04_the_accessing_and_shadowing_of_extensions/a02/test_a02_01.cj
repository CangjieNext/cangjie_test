/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a02_01

  @Level:         1

  @Assertion:       8.4(2) It is also possible to omit this from accessing members.

  @Description:     Check that extended type instance member can omit "this" when accesing member in own 
                    type instance.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

type MyType = Int64

extend MyType {
    func double() { this * 2 }
    func info() { "${this.toString()} ${double()}" }
}

class MyClass {
    var myStringVar: String = "wetgweg"

    func myBaseSetFunc(a: String) {
        this.myStringVar = a
    }

    func myBaseGetFunc() {
        this.myStringVar
    }
}

extend MyClass {
    func myExtendedSetFunc0(a: String) {
        this.myStringVar = a
    }

    func myExtendedSetFunc1(a: String) {
        myStringVar = a
    }

    func myExtendedSetFunc2(a: String) {
        myBaseSetFunc(a)
    }

    func myExtendedSetFunc3(a: String) {
        this.myBaseSetFunc(a)
    }

    func myExtendedGetFunc0() {
        this.myBaseGetFunc()
    }

    func myExtendedGetFunc1() {
        myBaseGetFunc()
    }

    func myExtendedGetFunc2() {
        myStringVar
    }

    func myExtendedGetFunc3() {
        this.myStringVar
    }
}

struct MyStruct {
    var myCharVar: Rune ='C'

    func myBaseGetFunc() {
        this.myCharVar
    }

    mut func myBaseSetFunc(a: Rune) {
        this.myCharVar = a
    }

}

extend MyStruct {
    func myExtendedGetFunc0() {
        this.myBaseGetFunc()
    }

    func myExtendedGetFunc1() {
        myBaseGetFunc()
    }

    func myExtendedGetFunc2() {
        myCharVar
    }

    func myExtendedGetFunc3() {
        this.myCharVar
    }

    mut func myExtendedSetFunc0(a: Rune) {
        this.myBaseSetFunc(a)
    }

    mut func myExtendedSetFunc1(a: Rune) {
        myBaseSetFunc(a)
    }

    mut func myExtendedSetFunc2(a: Rune) {
        myCharVar = a
    }

    mut func myExtendedSetFunc3(a: Rune) {
        this.myCharVar = a
    }
}

main() { 
    var myTypeVar: MyType = 12
    Assert.equals(24, myTypeVar.double())
    Assert.equals("12 24", myTypeVar.info())

    var myClassImpl = MyClass()
    Assert.equals("wetgweg", myClassImpl.myBaseGetFunc())
    Assert.equals("wetgweg", myClassImpl.myExtendedGetFunc0())
    Assert.equals("wetgweg", myClassImpl.myExtendedGetFunc1())
    Assert.equals("wetgweg", myClassImpl.myExtendedGetFunc2())
    Assert.equals("wetgweg", myClassImpl.myExtendedGetFunc3())
    myClassImpl.myBaseSetFunc("w#t*weL")
    Assert.equals("w#t*weL", myClassImpl.myExtendedGetFunc3())
    myClassImpl.myExtendedSetFunc0("dTb$")
    Assert.equals("dTb$", myClassImpl.myExtendedGetFunc3())
    myClassImpl.myExtendedSetFunc1("%K*UYOIAF")
    Assert.equals("%K*UYOIAF", myClassImpl.myExtendedGetFunc2())
    myClassImpl.myExtendedSetFunc2("g(*YOHLSAF")
    Assert.equals("g(*YOHLSAF", myClassImpl.myExtendedGetFunc1())
    myClassImpl.myExtendedSetFunc3("_KA")
    Assert.equals("_KA", myClassImpl.myExtendedGetFunc0())

    var myStructImpl = MyStruct()
    Assert.equals(r'C', myStructImpl.myBaseGetFunc())
    Assert.equals(r'C', myStructImpl.myExtendedGetFunc0())
    Assert.equals(r'C', myStructImpl.myExtendedGetFunc1())
    Assert.equals(r'C', myStructImpl.myExtendedGetFunc2())
    Assert.equals(r'C', myStructImpl.myExtendedGetFunc3())
    myStructImpl.myExtendedSetFunc0(r'v')
    Assert.equals(r'v', myStructImpl.myExtendedGetFunc3())
    myStructImpl.myExtendedSetFunc1(r'R')
    Assert.equals(r'R', myStructImpl.myExtendedGetFunc2())
    myStructImpl.myExtendedSetFunc2(r'p')
    Assert.equals(r'p', myStructImpl.myExtendedGetFunc1())
    myStructImpl.myExtendedSetFunc3(r'T')
    Assert.equals(r'T', myStructImpl.myExtendedGetFunc0())
} 
