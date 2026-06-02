/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a34_02

  @Level:         1

  @Assertion: 4.28(34) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              &&        Left associative   Logic AND       expr1 && expr2       Bool 
              ||        Left associative   Logic OR        expr1 || expr2       Bool

  @Description: Check that '&&' operator has higher precedence than '||' operator.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore

*/

import utils.assert.Assert

main() {
    Assert.equals(true, {=> false}() && false || true)
    Assert.equals(true, ({=> false}() && false) || true)
    Assert.equals(false, {=> false}() && (false || true))
    return
}

