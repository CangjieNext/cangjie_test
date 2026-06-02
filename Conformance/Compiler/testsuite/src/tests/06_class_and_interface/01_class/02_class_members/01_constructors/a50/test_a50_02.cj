/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a50_02

  @Level:         1

  @Assertion: 6.1.2.1(50)
              Init constructors in the class can call other constructors (via this call expression)
              in the class or superclass‘s constructor(via super call expression),
              but only one of them can be called.

  @Description: Check that this can not be called after super in a constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class B {
    init() {}
}

class A <: B {
    init(x: Int64) {
        super()
        this()
    }
    init() {}
}

main() {
}