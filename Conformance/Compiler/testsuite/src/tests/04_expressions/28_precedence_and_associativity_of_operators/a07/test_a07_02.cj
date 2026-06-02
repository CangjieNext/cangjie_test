/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a07_02

  @Level:         1

  @Assertion: 4.28(7) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage           Expression type

              ()        Left associative   Function call  funcName(expr)  Return type of funcName

  @Description: Check the '()' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func foo(): String {
    return "hellow world"
}

func bar(): Int64 {
    return 42
}

func baz(): Float64 {
    return 42.0
}

main() {
    Assert.isTrue(foo() is String)
    Assert.isTrue(bar() is Int64)
    Assert.isTrue(baz() is Float64)
}

