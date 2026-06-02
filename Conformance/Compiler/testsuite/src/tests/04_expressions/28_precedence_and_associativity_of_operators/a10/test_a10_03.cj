/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a10_03

  @Level:         1

  @Assertion: 4.28(10) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              ?         None               Question mark     expr1?.expr2 etc. Option<T> (T is the type of expr2)
              !         Right associative  Bitwise Logic NOT !expr             The type of expr

  @Description: Check the '?' operator has higher precedence than '!' operator. Checks the positive case where correct
                precendence leads to correct result.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var b1 = false
    var b2 = true
}

extend<T> Option<T> {
    operator func!() {
        match (this) {
            case Some(v) => Option<T>.Some(v)
            case None => Option<T>.None
        }
    }
}

main() {
    var c: ?C = C()

    // NOTE: (!c)?.b1, (!c)?.b2 is a compilation error and checked separately.
    
    let x1 = !c?.b1
    let y1 = !(c?.b1)
    Assert.equals(y1.getOrThrow(), x1.getOrThrow())

    let x2 = !c?.b2
    let y2 = !(c?.b2)
    Assert.equals(y2.getOrThrow(), x2.getOrThrow())

    return
}

