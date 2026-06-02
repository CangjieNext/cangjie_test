/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a09_01

  @Level:         1

  @Assertion:   8.1.2(9)
                interface I{
                  func f():Unit
                }
                class Foo <:I {
                  func f():Unit {}
                }
                extend Foo <:I {} // error, can not repeat the implementation of the interface
                class Bar {}
                extend Bar <:I {
                  func f():Unit {}
                }
                extend Bar <:I {} // error, already implemented through the extension can not
                                  // repeat the implementation

  @Description: Checks that extend Foo <:I from the example is a error.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

interface I {
    func f(): Unit
}

class Foo <: I {
    func f(): Unit {}
}

extend Foo <: I {} // error, can not repeat the implementation of the interface

main() { }
