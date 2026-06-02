/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a15_03

  @Level:         1

  @Assertion:       8.4(15) In addition to the preceding accessibility rules, whether members of other extensions 
                    of the same type can be directly used in an extension of a generic type must meet the following 
                    rules: If the constraints of two extensions are the same, the members of each other can be 
                    directly used in the two extensions.

  @Description:     Check that extensions of generic type with the different generic constraints can't directly use 
                    members of own siblings: struct extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/
struct MyStruct<A> {}

extend MyStruct<K> where K <: Int32 { 
    func myKFunc(a: K): Int32 {
        myRFunc(a) -6
    }
}

extend MyStruct<R> where R <: Float32 { 
    func myRFunc(a: R) {
        a
    }
}

main(): Unit {}
