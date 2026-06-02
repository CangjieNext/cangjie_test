/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a13_03

  @Level:         1

  @Assertion:   8.1.2(13) If the type being extended already contains the functions required
                by the interface, the interface extension cannot re-implement these functions
                and does not use the default implementation in the interface.

  @Description: Checks that interface extension cannot re-implement the function if type type
                being extended already contains it.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

interface I {
    func foo(): Rune { 'b' }
}

class A {
    public func foo(): Rune { 'a' }
}

extend A <: I {
    public func foo(): Rune { 'c' }
}

main() { }
