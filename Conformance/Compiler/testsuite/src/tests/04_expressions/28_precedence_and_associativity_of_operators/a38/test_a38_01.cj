/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a38_01

  @Level:         1

  @Assertion: 4.28(38) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              ~>        Left associative   Composition     expr1 ~> expr2       The type of expr1 ~> expr2 is the type
                                                                                of the lambda expression
                                                                                {x=>expr2(expr1(x))}
              =         None               Assignment      leftValue = expr     Unit

  @Description: Check the '~>' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func f(x: String) {
    return 5.0
}

func g(x: Int64) {
    return "hi"
}

class C {}

func h(x: String) {
    return C() 
}

main() {
    let foo = g ~> f
    let bar = g ~> h
    Assert.isTrue(foo is (Int64) -> Float64)
    Assert.isTrue(bar is (Int64) -> C)
    return
}

