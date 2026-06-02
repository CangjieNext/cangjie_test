/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a42_01_aor_bool

  @Level:         1

  @Assertion:    1.4(42) ||=

  @Description:  Check lexical ability of Compound assignmen with logical OR (=||).

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
    var res1: TestedType =  ct_opnd1;
    var res2: TestedType =  rt_opnd1;
    res1 ||= ct_opnd2;
    res2 ||= rt_opnd2;
    Assert.equals(res1, res2)
    res1 = ct_opnd1
    res2 = rt_opnd1
    Assert.equals(res1, res2)
    0
}