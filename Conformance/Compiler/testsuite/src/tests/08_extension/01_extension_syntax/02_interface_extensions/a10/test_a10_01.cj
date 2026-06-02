/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a10_01

  @Level:         1

  @Assertion:   8.1.2(10) If the type being extended has already directly implemented a non-
                generic interface, the extension cannot be used to re-implement the same
                interface.

  @Description: Checks that extension cannot re-implement interface if type already implements
                this interface.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

interface I {
    func foo(): Int64
}

class Foo <: I {
    public func foo(): Int64 { 33 }
}

extend Foo <: I {
    public func foo(): Int64 { 44 }
}

main() { }
