/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_14

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check that an immutable super instance property can not be accessed inside 
                the primary constructor before all the instance variables are initialized

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006194, 0006124

  @Comment: From the description in the init constructor section:
            Before all of the instance member variables are initialized,
            the constructor cannot use functions or lambda that capture this
            or use super functions by super.f or use separate this expression

*/

open class P {
  prop p: Int64 {
    get() {
      10
    }
  }
}

class A <: P {
  A() {
    let a = p

    this.x = 1
  }

  var x: Int64
}

main() {
}