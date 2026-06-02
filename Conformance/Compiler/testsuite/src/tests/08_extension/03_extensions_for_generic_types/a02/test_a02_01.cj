/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a02_01

  @Level:         1

  @Assertion:       8.3(2) Type variables in an extended type implicitly introduce generic constraints in the type 
                    definition.

  @Description:     Check extensions of generic types with generic constraints.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type MyType = ToString

class MyClass<MyType> {
    var myClassVar: MyType

    MyClass(a: MyType) {
        myClassVar = a
    }
}

extend<W> MyClass<W>  {
    func myFunc(): W {
        myClassVar
    }
}

struct MyStruct<G> where G <: ToString {
    var myStructVar: G

    MyStruct(a: G) {
        myStructVar = a
    }
}
extend<W> MyStruct<W>  {
    func myFunc(): W {
        myStructVar
    }
}

main() { 
    var myClassImpl = MyClass<Bool>(false)    
    let myBoolVar = myClassImpl.myFunc()
    Assert.isTrue(myBoolVar is MyType)
    Assert.isTrue(myBoolVar is Bool)
    Assert.equals(false, myBoolVar)

    var myStructImpl = MyStruct<Int32>(12)
    let myInt32Var = myStructImpl.myFunc()
    Assert.isTrue(myInt32Var is Int32)
    Assert.equals(12, myInt32Var)
} 
