/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a38_03

  @Level:         1

  @Assertion: 4.28(38) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              ~>        Left associative   Composition     expr1 ~> expr2       The type of expr1 ~> expr2 is the type
                                                                                of the lambda expression
                                                                                {x=>expr2(expr1(x))}
              =         None               Assignment      leftValue = expr     Unit

  @Description: Check that '~>' operator has higher precedence than '=' operator. Check the negative case where
                incorrect precedence leads to a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

func f(x: String) {
    return 5.0
}

func g(x: Int64) {
    return "hi"
}

main() {
    var bar = g ~> f
    (bar = g) ~> f
    return
}

