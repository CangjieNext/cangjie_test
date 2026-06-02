/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_04

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can override several functions with one function
                even when all overridden functions have unrelated return types
                as long as the return type of the overriding function is a subtype of them all.

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @Issue: 0006426, 0006429

*/

// This is a compile-only case. The Nothing type indicates a dead code.
// There's no telling what the compiler will do with it
// even with a throw inside the function
class E <: Exception {}

interface J1 {
    func f(): Int64
}

interface J2 {
    func f(): Bool
}

interface J3<T> {
    func f(): T
}

interface J4 {
    func f(): () -> Int64
}

interface J5 {
    func f(): Unit
}

open class B {
    public open func f(): Rune {
        return r'a'
    }
}

class T2 <: B & J1 & J2 & J3<Any> & J4 & J5 {
    public override func f(): Nothing {
        throw E()
    }
}

main() {
}