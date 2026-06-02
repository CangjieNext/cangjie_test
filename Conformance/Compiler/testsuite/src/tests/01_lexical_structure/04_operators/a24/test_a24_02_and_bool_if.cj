/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a24_02_and_bool_if

  @Level:         1

  @Assertion:    1.4(24) && Logic AND

  @Description:  Check LogicalAND (&&) in if-statement

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/


import utils.assert.Assert

type TestedType = Bool;
let ct_opnd1   :  TestedType  =  false
let ct_opnd2   :  TestedType  =  true


main(ina :Array<String>) {
    var RTT : TestedType =  Assert.getRuntimeZero(ina) == 0
    var RTF : TestedType =  Assert.getRuntimeZero(ina) != 0
    var rt_opnd1: TestedType = RTF &&  RTT;
    var rt_opnd2: TestedType = ct_opnd2 &&  RTT;
    if (rt_opnd1 && rt_opnd2) {
        Assert.fail()
    } else {
    }
    0
}