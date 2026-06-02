/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a25_02_or_bool_if

  @Level:         1

  @Assertion:    1.4(25) || Logic OR

  @Description:  Check Logical OR (||) in if-statement

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
    var RTZero : TestedType =  Assert.getRuntimeZero(ina) != 0
    var rt_opnd1: TestedType = ct_opnd1 ||  RTZero;
    var rt_opnd2: TestedType = ct_opnd2 ||  RTZero;
    if (rt_opnd1 || rt_opnd2) {
    } else {
        Assert.fail()
    }
    0
}