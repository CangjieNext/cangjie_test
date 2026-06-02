/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_30

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that a member variable unnamed parameter that has a class type can not accept
                an arguments of a different type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

*/

class B {}

class A {
  A(let x: B) {}
}

main() {
  let a = A(())
}
