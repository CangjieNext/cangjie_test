/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a01_01_function_call

  @Level:         1

  @Assertion:    10.2(1) The Cangjie programming language defines a set of operators
                 that are represented by special symbols (see Chapter 4 Expressions for all operators),
                 such as arithmetic operators (i.e., +,-,*,/,%and **),
                 logic operator (i.e., !,&&and ||), function call operator (), etc.

  @Description:  Some operators examples. Call, add, mul

  @Mode:         run

  @Negative:     no

  @Structure:    single



*/

import utils.assert.Assert


func add(p1: Int64, p2: Int64):Int64
{
    Assert.equals(p1,2)
    Assert.equals(p2,3)
    p1 + p2 
}
func mul(p1: Int64, p2: Int64):Int64
{ 
    Assert.equals(p1,7)
    Assert.equals(p2,3)
    p1 * p2 
}

main(ina :Array<String>) {
    Assert.equals(add(2,3),5)
    Assert.equals(mul(7,3),21)
    return 0;
}
