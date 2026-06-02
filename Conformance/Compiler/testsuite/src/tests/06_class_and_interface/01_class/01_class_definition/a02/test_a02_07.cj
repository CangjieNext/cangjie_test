/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a02_07

  @Level:         1

  @Assertion: 6.1.1(2)
              A class definition consists of the following parts.
              - optional modifiers
              - the class keyword
              - class name
              - optional type parameters
              - optional superclass or a list of super interfaces (listed after <:, and seperated by &). Superclass should be listed at the beginging if there is one.
              - optional generic constraints using keyword where
              - class body

  @Description: Check that a name can not be omitted for a class definition with modifiers and without interfaces or generic parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


public open class {
  func someFunc() {
    return 1
  }

  var someVar = ""
}

main() {
}
