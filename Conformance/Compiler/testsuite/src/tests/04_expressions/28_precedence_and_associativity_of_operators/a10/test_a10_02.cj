/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a10_02

  @Level:         1

  @Assertion: 4.28(10) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              ?         None               Question mark     expr1?.expr2 etc. Option<T> (T is the type of expr2)
              !         Right associative  Bitwise Logic NOT !expr             The type of expr

  @Description: Check the '?' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var i64Val = 0
    var i64Opt = Option<Int64>.None

    var f64Val = 0.0
    var f64Opt = Option<Float64>.None

    var strVal = "hello world"
    var strOpt = Option<String>.None
}

main() {
    var c: ?C = C()
    Assert.isTrue(c?.i64Val is Option<Int64>)
    Assert.isTrue(c?.i64Opt is Option<Option<Int64>>)
    Assert.isTrue(c?.f64Val is Option<Float64>)
    Assert.isTrue(c?.f64Opt is Option<Option<Float64>>)
    Assert.isTrue(c?.strVal is Option<String>)
    Assert.isTrue(c?.strOpt is Option<Option<String>>)
    return
}

