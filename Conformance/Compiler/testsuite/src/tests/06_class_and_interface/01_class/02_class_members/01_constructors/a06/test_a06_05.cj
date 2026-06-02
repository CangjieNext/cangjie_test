/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a06_05

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(6)
              Parameter list: The primary constructor name is followed by a parameter list.

  @Description: Check that it's illegal for a public primary constructor 
                not to have a parameter list

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  public A {}
}

main() {
}
