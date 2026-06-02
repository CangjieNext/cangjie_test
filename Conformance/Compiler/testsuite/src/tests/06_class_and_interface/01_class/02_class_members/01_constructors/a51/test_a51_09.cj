/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a51_09

  @Level:         1

  @Assertion: 6.1.2.1(51)
              If called, it must be at the first expression in the constructor body,
              without any expression or declaration before it.

  @Description: Check that super can not be called at the end of the constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            "Init constructors in the class can call other constructors (via this call expression)
            in the class or superclass‘s constructor(via super call expression),
            but only one of them can be called.


*/

open class B {}

class A <: B {
    init(x: Int64) {
        let a = 1
        func f(x: Int64) {
            return x + 1
        }
        f(a)
        super()
    }
}

main() {
}