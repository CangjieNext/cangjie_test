/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a14_04

  @Level:         1

  @Assertion: 6.2.2.1(14)
              Functions modified with mut are a special kind of instance member function
              that can be used to abstract the mutable behavior of struct types.

  @Description: Check that a static non-generic function with a body
                can not be modified by the 'mut' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006358

*/

interface I {
    mut static func f() {}
}

main() {
}