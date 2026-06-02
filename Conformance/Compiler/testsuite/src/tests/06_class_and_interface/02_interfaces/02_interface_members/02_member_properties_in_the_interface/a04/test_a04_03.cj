/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a04_03

  @Level:         1

  @Assertion: 6.2.2.2(4)
              this can be used in the default implementation of an instance member function,
              and the type of this is the current interface.

  @Description: Check that the compile-time type of 'this'
                in the getter of an instance immutable property is the current interface type
                and it can not be cast down to the type of the subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006374, 0006124

*/

interface I {
    prop p: Int64 {
        get() {
            let x: A = this
            1
        }
    }
}

class A <: I {}

main() {
}