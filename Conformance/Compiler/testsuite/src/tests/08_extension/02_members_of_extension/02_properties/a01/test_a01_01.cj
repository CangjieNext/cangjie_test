/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_a01_01

  @Level:         1

  @Assertion:       8.2.2(1) Extensions can add properties to the type being extended.

  @Description:     Check that property can be defined in extensions.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

type MyType = Int64

extend MyType {
    prop v: Int64 {
        get() { this + 1 }
    }
}

class MyClass {
    var myVar = r'C'
}

extend MyClass {
    prop c: Rune {
        get() { this.myVar }
    }
}

struct MyStruct {
    var myVar = true
}

extend MyStruct {
    prop b: Bool {
        get() { this.myVar }
    }
}

enum MyEnum {
    R
}

extend MyEnum {
    prop e: String {
        get() { "MyEnum" }
    }
}

main() { 
    var myVar: MyType = 12
    Assert.isTrue(myVar is Int64)
    Assert.isTrue(myVar is MyType)
    Assert.equals(12, myVar)
    Assert.equals(13, myVar.v)

    var myClassImpl = MyClass()
    Assert.equals(r'C', myClassImpl.c)
    Assert.equals(r'C', myClassImpl.myVar)

    var myStructImpl = MyStruct()
    Assert.equals(true, myStructImpl.b)
    Assert.equals(true, myStructImpl.myVar)

    Assert.equals("MyEnum", MyEnum.R.e)
} 
