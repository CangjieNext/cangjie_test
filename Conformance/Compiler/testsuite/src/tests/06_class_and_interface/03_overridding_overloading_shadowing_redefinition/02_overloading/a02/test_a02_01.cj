/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a02_01

  @Level:         1

  @Assertion: 6.3.2(2)
              open class Base {}
              class Sub <: Base {}
              open class C{
                static func foo(a: Base) {
                }
              }
              open class B <: C {
                func foo(a: Sub) { // Error
                  C.foo(Sub())
                }
              }
              class A <: B {
                // Static and instance functions cannot be overloaded.
                static func foo(a: Sub) {} // Error
              }

  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Base {}
class Sub <: Base {}
open class C{
    static func foo(a: Base) {
    }
}
open class B <: C {
    func foo(a: Sub) { // Error
        C.foo(Sub())
    }
}

main() {
}