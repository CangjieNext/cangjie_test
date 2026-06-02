/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a04_02

  @Level:         1

  @Assertion:       8.3(4) We can use additional generic constraints in extensions, functions added in this way can 
                    only be used if the instance of the type is in compliance with the generic constraints, otherwise 
                    an error will be reported.

  @Description:     Check that if additional generic constraints are used in type extensions, functions added in this 
                    way will not work with types which are not in compliance with these additional generic constraints 
                    and will raise an error.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct<G> {
    var myStructVar: G

    MyStruct(a: G) {
        myStructVar = a
    }
}

extend MyStruct<W> where W <: ToString {

    func myFunc(): W {
        myStructVar
    }
}

type MyType = (Int32, Bool)

main() { 
    var myStructImpl4 = MyStruct<MyType>((12, true))
    let myTypleVar = myStructImpl4.myFunc()
} 
