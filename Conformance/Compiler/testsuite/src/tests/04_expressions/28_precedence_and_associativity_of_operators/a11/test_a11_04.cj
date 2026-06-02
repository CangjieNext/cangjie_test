/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a11_04

  @Level:         1

  @Assertion: 4.28(11) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              !         Right associative  Bitwise Logic NOT !expr             The type of expr
              **        Right associative  Power             expr1 ** expr2    The type of expr1

  @Description: Check that '!' operator has higher precedence than '**' operator. Check negative case where incorrect
                precedence would lead to a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

class B {
    operator func!() {
        return 5
    }
}

main() {
    let b = B()

    // let x = !b ** 2
    let y = !(b ** 2) // incorrect precedence leads to a compilation error.

    return
}

