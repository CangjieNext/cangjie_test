/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a03_02

  @Level:         1

  @Assertion: 4.13(3) The classified as member access expressions, function call expressions, index expressions can be
              preceded by an optional ? operator, in order to make Option types support the above postfix
              operators. For the ? operator, see below for details.

  @Description: Check that increment expression preceded by ? causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var u :? Int64 = 1
    u?++
}

