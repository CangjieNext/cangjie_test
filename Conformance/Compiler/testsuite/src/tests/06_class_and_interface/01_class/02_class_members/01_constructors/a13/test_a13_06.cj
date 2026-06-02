/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a13_06

  @Level:         1

  @Assertion: 6.1.2.1(13)
              In addition, it is supported by using ! indicates whether the parameter is a named parameter.

  @Description: Check that a let member variable parameter with a default value
                requires a name prefix during the primary constructor invocation

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

*/

class A {
  A(let x!: Int64 = 1) {}
}

main() {
  A(1)
}