/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a11_01

  @Level:         1

  @Assertion:       8.4(11) The same type can be extended any number of times within the same package.

  @Description:     Check that type can be extended any number of times within the same package.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
package pkg1

import utils.assert.Assert

type MyType = Int64

extend MyType {
    func func1() { this + 1 }
}

extend MyType {
    func func2() { this + 2 }
}

extend MyType {
    func func3() { this + 3 }
}

extend MyType {
    func func4() { this + 4 }
}

extend MyType {
    func func5() { this + 5 }
}

class MyClass {
    var myInt64Var: Int64 = 55

}

extend MyClass {
    func myExtendedFunc1() {
        myInt64Var + 1
    }
}

extend MyClass {
    func myExtendedFunc2() {
        myInt64Var + 2
    }
}

extend MyClass {
    func myExtendedFunc3() {
        myInt64Var + 3
    }
}

extend MyClass {
    func myExtendedFunc4() {
        myInt64Var + 4
    }
}

extend MyClass {
    func myExtendedFunc5() {
        myInt64Var + 5
    }
}

struct MyStruct {
}

extend MyStruct {
    func myExtendedFunc1() { 'A' }
}
extend MyStruct {
    func myExtendedFunc2() { 'B' }
}
extend MyStruct {
    func myExtendedFunc3() { 'C' }
}
extend MyStruct {
    func myExtendedFunc4() { 'D' }
}
extend MyStruct {
    func myExtendedFunc5() { 'E' }
}

enum myEnum {
    A
}
extend myEnum {
    func myExtendedFunc1() { true }
}

extend myEnum {
    func myExtendedFunc2() { false }
}

extend myEnum {
    func myExtendedFunc3() { true }
}

extend myEnum {
    func myExtendedFunc4() { false }
}

extend myEnum {
    func myExtendedFunc5() { true }
}

main() { 

    var myTypeVar: MyType = 12
    Assert.equals(13, myTypeVar.func1())
    Assert.equals(14, myTypeVar.func2())
    Assert.equals(15, myTypeVar.func3())
    Assert.equals(16, myTypeVar.func4())
    Assert.equals(17, myTypeVar.func5())

    var myClassImpl = MyClass()
    Assert.equals(56, myClassImpl.myExtendedFunc1())
    Assert.equals(57, myClassImpl.myExtendedFunc2())
    Assert.equals(58, myClassImpl.myExtendedFunc3())
    Assert.equals(59, myClassImpl.myExtendedFunc4())
    Assert.equals(60, myClassImpl.myExtendedFunc5())

    var myStructImpl = MyStruct()
    Assert.equals('A', myStructImpl.myExtendedFunc1())
    Assert.equals('B', myStructImpl.myExtendedFunc2())
    Assert.equals('C', myStructImpl.myExtendedFunc3())
    Assert.equals('D', myStructImpl.myExtendedFunc4())
    Assert.equals('E', myStructImpl.myExtendedFunc5())

    Assert.equals(true, myEnum.A.myExtendedFunc1())
    Assert.equals(false, myEnum.A.myExtendedFunc2())
    Assert.equals(true, myEnum.A.myExtendedFunc3())
    Assert.equals(false, myEnum.A.myExtendedFunc4())
    Assert.equals(true, myEnum.A.myExtendedFunc5())
} 
