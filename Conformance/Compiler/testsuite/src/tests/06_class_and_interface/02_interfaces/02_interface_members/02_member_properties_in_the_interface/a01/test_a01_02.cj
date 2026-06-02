/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a01_02

  @Level:         1

  @Assertion: 6.2.2.2(1)
              Properties can also be defined in interface,
              see Chapter 7 for the syntax of defining member properties.

  @Description: Check that a property definition must be correct:
                an instance mutable property without a default implementation
                can not omit the type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I {
    mut prop p
}

main() {
}