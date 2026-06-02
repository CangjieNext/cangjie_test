/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a10_24

  @Level:         1

  @Assertion: 6.2.2.1(10)
              When a static member function is called directly using the interface type name,
              it will be compiled with an error if the function contains a direct 
              or indirect call to another static function that is not implemented
              in the interface (by itself or by another interface).

  @Description: Check that static functions that calls
                an unimplemented generic static function of the superinterface
                that is an overloaded variant of itself
                can not be called through the type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface S {
    static func g<T>(x: Int64): Unit
}

interface I <: S {
    static func g<T>() {
        g<Unit>(1)
    }
}

main() {
    I.g<Unit>()
}