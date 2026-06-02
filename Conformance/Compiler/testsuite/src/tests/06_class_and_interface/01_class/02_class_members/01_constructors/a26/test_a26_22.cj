/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_22

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check that a mutable instance property can not be accessed through 'this' inside 
                the primary constructor of an open class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

  @Comment: From the description in the init constructor section:
            Calling instance member functions or properties is forbidden in constructors of open classes.

*/

open class A {
  A() {
    let a = this.p
  }

  mut prop p: Int64 {
    get() {
      10
    }

    set(v) {}
  }
}

main() {
}