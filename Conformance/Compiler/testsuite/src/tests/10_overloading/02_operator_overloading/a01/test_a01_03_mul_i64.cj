/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a01_03_mul_i64

  @Level:         1

  @Assertion:    10.2(1) The Cangjie programming language defines a set of operators
                 that are represented by special symbols (see Chapter 4 Expressions for all operators),
                 such as arithmetic operators (i.e., +,-,*,/,%and **),
                 logic operator (i.e., !,&&and ||), function call operator (), etc.

  @Description:  Some operators examples. arithmetic mul, add


  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/


import utils.assert.Assert

type TestedType = Int64;
let ct0        :  TestedType  =  0i64
let ct_opnd1   :  TestedType  =  7i64
let ct_opnd2   :  TestedType  = -21i64

var RTZero : TestedType =  ct_opnd1;

func BinOp(Operand1:TestedType, Operand2:TestedType): TestedType 
    {Operand1 * Operand2
    }

main(ina :Array<String>) {
    let z : Bool = Assert.getRuntimeZero(ina) == 0
    if (z) {RTZero = ct0;}
    var rt_opnd1: TestedType = ct_opnd1 +  RTZero;
    var rt_opnd2: TestedType = ct_opnd2 +  RTZero;
    Assert.equals(ct_opnd1*ct_opnd2,rt_opnd1*rt_opnd2)
    Assert.equals(ct_opnd1*rt_opnd2,rt_opnd1*ct_opnd2)
    Assert.equals(BinOp(ct_opnd1,ct_opnd2),BinOp(rt_opnd1,rt_opnd2))
    0
}