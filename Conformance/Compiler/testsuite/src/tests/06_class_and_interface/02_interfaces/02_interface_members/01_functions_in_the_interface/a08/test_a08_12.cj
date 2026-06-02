/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a08_12

  @Level:         1

  @Assertion: 6.2.2.1(8)
              A static function without a function body cannot be called directly using the interface type.

  @Description: Check that a non-generic static function without a body
                can not be called through the super-interface type inside a function of a sub-interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface S {
    static func f(): Unit
}

interface I <: S {
    static func g() {
        S.f()
    }
}

main() {
}