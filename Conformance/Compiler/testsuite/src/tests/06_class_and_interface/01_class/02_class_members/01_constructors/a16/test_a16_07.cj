/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a16_07

  @Level:         1

  @Assertion: 6.1.2.1(16)
              The member variable defined in the primary constructor
              cannot have the same name as those outside the primary constructor.

  @Description: Check that a protected let member variable unnamed parameter
                can not have the same name as a class member variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single


*/

class Test {
  Test(protected let a: Int64) {}

  var a = 1
}

main() {
}