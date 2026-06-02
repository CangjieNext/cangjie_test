/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a11_02

  @Level:         1

  @Assertion:   8.1.2(11) If the type being extended has already directly implemented a
                generic interface, the extension cannot be used to re-implement the same
                interface with the same type arguments.

  @Description: Checks that extension can re-implement generic interface with type arguments
                other than the type being extended.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single


*/

interface I<T> {
    func foo(i: T): String
}

class Foo <: I<String> {
    public func foo(i: String): String { "a" }
}

extend Foo <: I<Int64> {
    public func foo(i: Int64): String { "b" }
}

main() { }
