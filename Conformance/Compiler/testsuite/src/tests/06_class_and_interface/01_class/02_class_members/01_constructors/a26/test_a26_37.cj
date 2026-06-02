/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_37

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check that instance super functions can not be called through 'super' inside 
                the primary constructor of an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: From the description in the init constructor section:
            Calling instance member functions or properties is forbidden in constructors of open classes.

*/

open class P {
  func f()  {}
}

abstract class A <: P {
  A() {
    super.f()
  }
}

main() {
}