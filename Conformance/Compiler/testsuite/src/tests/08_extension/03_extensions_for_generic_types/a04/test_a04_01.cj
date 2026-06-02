/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a04_01

  @Level:         1

  @Assertion:       8.3(4) We can use additional generic constraints in extensions, functions added in this way can 
                    only be used if the instance of the type is in compliance with the generic constraints, otherwise 
                    an error will be reported.

  @Description:     Check that if additional generic constraints are used in type extensions, functions added in this 
                    way will work with types which are in compliance with these additional generic constraints.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

struct MyStruct<G> {
    var myStructVar: G

    MyStruct(a: G) {
        myStructVar = a
    }
}

extend<W> MyStruct<W> where W <: ToString {
    func myFunc(): W {
        myStructVar
    }
}

main() { 

    var myStructImpl0 = MyStruct<Int32>(12)
    let myInt32Var = myStructImpl0.myFunc()
    Assert.isTrue(myInt32Var is Int32)
    Assert.equals(12, myInt32Var)

    var myStructImpl1 = MyStruct<Bool>(true)
    let myBoolVar = myStructImpl1.myFunc()
    Assert.isTrue(myBoolVar is Bool)
    Assert.equals(true, myBoolVar)

    var myStructImpl2 = MyStruct<Rune>(r'v')
    let myCharVar = myStructImpl2.myFunc()
    Assert.isTrue(myCharVar is Rune)
    Assert.equals(r'v', myCharVar)

    var myStructImpl3 = MyStruct<String>("w3t4tg")
    let myStringVar = myStructImpl3.myFunc()
    Assert.isTrue(myStringVar is String)
    Assert.equals("w3t4tg", myStringVar)
} 
