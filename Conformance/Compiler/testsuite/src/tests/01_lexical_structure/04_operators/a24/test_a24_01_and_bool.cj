/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a24_01_and_bool

  @Level:         1

  @Assertion:    1.4(24) && Logic AND

  @Description:  Check lexical ability of Logical AND (&&).

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

  @Issue:        6585

*/


import utils.assert.Assert

type TestedType = Bool;
let ctOpnd1   :  TestedType  =  false
let ctOpnd2   :  TestedType  =  true

func BinOp(Operor1:TestedType, Operor2:TestedType): TestedType { 
    Operor1 && Operor2
}

main(ina :Array<String>) {
    var RTZero : TestedType =  Assert.getRuntimeZero(ina) != 0
    var rtOpnd1: TestedType = ctOpnd1 &&  RTZero;
    var rtOpnd2: TestedType = ctOpnd2 &&  RTZero;
    Assert.equals(ctOpnd1 && ctOpnd2,rtOpnd1 && rtOpnd2)
    Assert.equals(ctOpnd1 && rtOpnd2,rtOpnd1 && ctOpnd2)
    Assert.equals(BinOp(ctOpnd1,ctOpnd2),BinOp(rtOpnd1,rtOpnd2))

    Assert.isTrue((ctOpnd1 && rtOpnd2) is TestedType)
    0
}