/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a10_05

  @Level:         1

  @Assertion: 6.2.2.1(10)
              When a static member function is called directly using the interface type name,
              it will be compiled with an error if the function contains a direct 
              or indirect call to another static function that is not implemented
              in the interface (by itself or by another interface).

  @Description: Check that static functions that calls
                an unimplemented non-generic static function of the same interface
                while there's also an implemented overloaded variant
                can not be called through the type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f(): Unit
    static func f(x: Int64) {}
    static func g() {
        f()
    }
}

main() {
    I.g()
}