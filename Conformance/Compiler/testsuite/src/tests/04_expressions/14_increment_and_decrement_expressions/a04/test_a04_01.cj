/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a04_01

  @Level:         1

  @Assertion: 4.14(4) Furthermore, the postfix increment/decrement operator is non-associative, and thus an expression
              containing multiple ++ or -- without parentheses are syntactically invalid.

  @Description: Check that ++ operator is non-associative within '++ ++' expression.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var p = 0
    p ++ ++
    return
}

