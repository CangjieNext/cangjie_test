/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a10_01

  @Level:         1

  @Assertion: 4.28(10) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              ?         None               Question mark     expr1?.expr2 etc. Option<T> (T is the type of expr2)
              !         Right associative  Bitwise Logic NOT !expr             The type of expr

  @Description: Check that '?' operator has no associativity.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var x = Option<Option<Int64>>.None
    x??
    return
}

