/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a39_10

  @Level:         1

  @Assertion: 6.1.2.4(39)
              static: The function modified with static is a static member function and must have a function body.

  @Description: Check that a static non-generic function with the empty signature
                can not be abstract in an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class Test {
    public static func f(): Unit
}

main() {
}