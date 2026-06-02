/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a08_52

  @Level:         1

  @Assertion: 6.1.2.1(8)
              The syntax and semantics of regular parameters are consistent 
              with those in the function definition.

  @Description: Check that a regular named parameter that has an array type can not accept
                an arguments of a different type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(x!: Array<Bool>) {}
}

main() {
  let a = A(x: ())
}
