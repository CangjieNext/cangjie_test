/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a01_15

  @Level:         1

  @Assertion: 6.2.4.1(1)
              When implementing an interface for a type other than an abstract class,
              you must implement all the functions.

  @Description: Check that a struct can not leave
                an abstract isntance mutable property from the superclass unimplemented

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006392, 0006124

*/

interface I {
    mut prop p: Int64
}

struct A <: I {}

main() {
}
