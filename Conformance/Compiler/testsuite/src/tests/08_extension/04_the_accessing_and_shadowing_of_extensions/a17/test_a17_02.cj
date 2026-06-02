/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a17_02

  @Level:         1

  @Assertion:       8.4(17) When two extensions have different constraints and there is no inclusion relationship 
                    between the two constraints, the two extensions cannot directly use members of each other.

  @Description:     Check that 2 extension of one generic type with different constraints which haven't inclusion 
                    relationship cannot directly use members of each other: class extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class MyClass<X> {}

extend MyClass<Y> where Y <: Int32 {
    func myFunc0(a: Int32) {
        a + 12
    }
}

extend MyClass<Z> where Z <: Rune {
    func myFunc1(a: Int32): String {
        myFunc0(a)
    }
}

main(): Unit {}
