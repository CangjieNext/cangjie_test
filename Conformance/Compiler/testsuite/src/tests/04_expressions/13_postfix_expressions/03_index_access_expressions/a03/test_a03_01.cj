/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a03_01

  @Level:         1

  @Assertion: 4.13.3(3) For the index access expression e[a] (assuming that e is of type T),
              we have the following rules.
              1. When T is a tuple type, e[a] is immutable.

  @Description: Check that 'e[a]' is immutable when type of 'e' is a tuple type.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var t = (1, 2, 3, 4, 5)
    t[2] = 1380
}

