/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a01_09

  @Level:         1

  @Assertion: 6.2.2.1(1)
              Interfaces can contain instance member functions and static member functions
              that are written in the same way as normal instance member functions and
              static member functions, but can have no function implementation;
              these functions are called abstract functions.

  @Description: Check that a function definition must be correct:
                a static function can not omit the parameter list

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006357

*/

interface I {
    static func f {}
}

main() {
}