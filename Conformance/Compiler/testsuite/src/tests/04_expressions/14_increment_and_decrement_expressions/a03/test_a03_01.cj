/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a03_01

  @Level:         1

  @Assertion: 4.14(3) Note that ++ and -- can only be used as postfix operators, i.e., prefix increment
              (e.g., ++x) and prefix decrement (e.g., --x) are not supported.

  @Description: Check that usage of ++ as prefix operator causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var p = 0
    ++p
    return
}

