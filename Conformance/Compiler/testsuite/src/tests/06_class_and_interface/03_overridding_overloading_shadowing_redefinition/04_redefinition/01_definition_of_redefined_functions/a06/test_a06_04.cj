/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_04

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can reedfine several functions with one function
                even when all redefined functions have unrelated return types
                as long as the return type of the redefining function is a subtype of them all.

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
    static func f(): Int64
    static func g<T>(): Int64
}

interface J2 {
    static func f(): Bool
    static func g<T>(): Bool
}

interface J3<T> {
    static func f(): T
    static func g<U>(): T
}

interface J4 {
    static func f(): () -> Int64
    static func g<T>(): () -> Int64
}

interface J5 {
    static func f(): Unit
    static func g<T>(): Unit
}

open class B {
    public static func f(): Rune {
        return r'a'
    }
    public static func g<T>(): Rune {
        return r'a'
    }
}

class T2 <: B & J1 & J2 & J3<Any> & J4 & J5 {
    public redef static func f(): Nothing {
        throw E()
    }
    public redef static func g<T>(): Nothing {
        throw E()
    }
}

main() {
}