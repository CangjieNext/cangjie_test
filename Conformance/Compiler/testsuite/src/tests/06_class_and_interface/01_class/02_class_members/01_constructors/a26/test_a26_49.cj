/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_49

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check that all mutable protected variables have to be initialized
                in the primary constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: From the description in the init constructor section:
            If a constructor does not explicitly call other constructors,
            ensure that all instance member variables declared in this class
            have been initialized before returned from the constructor.
            Otherwise, an error will be reported during compilation.

*/

abstract class A {
  A() {
  }

  protected var a: Int64
}

main() {
}