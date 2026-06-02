/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a02_03_and_bool

  @Level:         1

  @Assertion:    10.2(2) By default, the type of operands for an operator can only
                 be of specific types, e.g., the operand of an arithmetic operator
                 can only be numeric types, and the operand of a logical operator 
                 can only be of Booltype.
  
  @Description:  Example whith checking result type

  @Description:  Some operators examples. Logical and

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

  @Issue:        0006123

*/


import utils.assert.Assert

type TestedType = Bool;
let ct_opnd1   :  TestedType  =  false
let ct_opnd2   :  TestedType  =  true

main(ina :Array<String>) {
    var RTZero : TestedType =  Assert.getRuntimeZero(ina) != 0
    var rt_opnd1: TestedType = ct_opnd1 &&  RTZero;
    var rt_opnd2: TestedType = ct_opnd2 &&  RTZero;
    Assert.equals(ct_opnd1 && ct_opnd2,rt_opnd1 && rt_opnd2)
    Assert.equals(ct_opnd1 && rt_opnd2,rt_opnd1 && ct_opnd2)
    Assert.isTrue((ct_opnd1 && rt_opnd2) is TestedType)
    0
}