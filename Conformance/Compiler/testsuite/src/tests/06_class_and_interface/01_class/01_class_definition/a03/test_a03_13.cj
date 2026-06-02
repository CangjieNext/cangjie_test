/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a03_13

  @Level:         1

  @Assertion: 6.1.1(3)
              Classes can be only defined at the top level of a file.

  @Description: Check that a class can not be defined inside an arithmetic expression

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

main() {
  var x = 1 + (class Two {let two = 2})
}
