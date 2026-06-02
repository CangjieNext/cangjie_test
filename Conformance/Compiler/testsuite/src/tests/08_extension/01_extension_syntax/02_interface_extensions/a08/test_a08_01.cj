/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a08_01

  @Level:         1

  @Assertion:   8.1.2(8) If the type being extended has already implemented an interface, it
                is not possible to repeat the implementation of the interface through the
                extension, including the use of the interface implemented by the extension.

  @Description: Checks that interface extension is not allowed for the class, which already
                implements this interface. Case where the extension implements interface methods.

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
    public func foo(): Int64 { 33 }
}

main() { }
