/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a28_06

  @Level:         1

  @Assertion: 6.1.2.1(28)
              When defining a primary constructor,
              regular parameters cannot be followed by member variable parameters

  @Description: Check that a member variable unnamed parameter
                can not be placed between two regular unnamed parameter

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006195

  @Comment: This assertion is clearly incorrect. It contradicts the syntax definition,
            the description of parameters and even the example in the next assertion

*/

class Test {
  Test(
    p1: Int64, let p2: Int64, p3: Int64
  ) {}
}

main() {
}