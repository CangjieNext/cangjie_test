/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a02_02

  @Level:         1

  @Assertion:       8.3(2) Type variables in an extended type implicitly introduce generic constraints in the type 
                    definition.

  @Description:     Check that generic type extension without satisfying generic constraints produces an error.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct<G> where G <: ToString {
    var myStructVar: G

    MyStruct(a: G) {
        myStructVar = a
    }
}

extend MyStruct<W> where W <: Int32 {
    func myFunc(): W {
        myStructVar
    }
}

main() { 
    var myStructImpl = MyStruct<Bool>(true)
    var myVar = myStructImpl.myFunc()
} 
