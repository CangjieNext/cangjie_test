/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a40_01

  @Level:         1

  @Assertion: 4.28(40) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              **=       None               Compound        leftValue **= expr   Unit
                                           assigned

  @Description: Check that '**=' is non-associative.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var x: Int64 = 2
    x **= 3 **= 4
    return
}

