/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a02_01

  @Level:         1

  @Assertion:       8.2.2.1(2) Properties modified with private can only be used inside this extension and are not 
                    visible outside.

  @Description:     Check that properties defined inside extensions with private modifier can be used inside extension.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

class MyClass {}

extend MyClass {
    private prop p1: Int64 { 
        get() { 1 }
    }

    func myFunc() {
        this.p1
    }
}

struct MyStruct {}

extend MyStruct {
    private prop p1: Int64 { 
        get() { 2 }
    }

    func myFunc() {
        this.p1
    }
}

enum MyEnum { A }

extend MyEnum {
    private prop p1: Rune { 
        get() { r'R' }
    }

    func myFunc() {
        this.p1
    }
}

main(): Unit {

    var myClassImpl = MyClass()
    Assert.equals(1, myClassImpl.myFunc())

    var myStructImpl = MyStruct()
    Assert.equals(2, myStructImpl.myFunc())

    Assert.equals(r'R', MyEnum.A.myFunc())    

}
