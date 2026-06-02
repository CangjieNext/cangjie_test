/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a17_03

  @Level:         1

  @Assertion:       8.4(17) When two extensions have different constraints and there is no inclusion relationship 
                    between the two constraints, the two extensions cannot directly use members of each other.

  @Description:     Check that 2 extension of one generic type with different constraints which haven't inclusion 
                    relationship cannot directly use members of each other: struct extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct<T> {}

extend MyStruct<P> where P <: Bool {
    func myBoolFunc(a: Bool) {
        !a
    }
}

extend MyStruct<G> where G <: String {
    func myStringFunc(a: String): Bool {
        myBoolFunc(a.size > 0)
    }
}

main(): Unit {}
