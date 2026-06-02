/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a04_03

  @Level:         1

  @Assertion: 6.1.2.1(4)
              The primary constructor name is the same as the type name.

  @Description: Check that a generic class can not have a primary constructor
                with a different name as the type name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class SomeName<T> {
  Name() {}
}

main() {
}