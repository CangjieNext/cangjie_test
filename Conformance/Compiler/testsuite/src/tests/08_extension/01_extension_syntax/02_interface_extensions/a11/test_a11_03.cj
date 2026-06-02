/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a11_03

  @Level:         1

  @Assertion:   8.1.2(11) If the type being extended has already directly implemented a
                generic interface, the extension cannot be used to re-implement the same
                interface with the same type arguments.

  @Description: Checks that extension cannot re-implement generic interface with the same
                type arguments as the type being extended.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

interface I<T> {
    func foo(i: T): String
}

class Foo <: I<Bool> {
    public func foo(i: Bool): String { "a" }
}

extend Foo <: I<Bool> {
    public func foo(i: Bool): String { "b" }
}

main() { }
