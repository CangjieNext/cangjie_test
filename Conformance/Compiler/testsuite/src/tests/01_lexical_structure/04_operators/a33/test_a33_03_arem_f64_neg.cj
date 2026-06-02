/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a33_03_arem_f64_neg

  @Level:         1

  @Assertion:    1.4(33) %=

  @Description:  Emit error when compound assignment with remainder uses float operand. Float64

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/



type TestedType = Float16;
let ct0        :  TestedType  = 0.0f64
let ct_opnd1   :  TestedType  = -3.3f64
let ct_opnd2   :  TestedType  = -2.0f64

var RTZero : TestedType =  ct_opnd1;

main(ina :Array<String>) {
    var rt_opnd1: TestedType = ct_opnd1 +  RTZero;
    var rt_opnd2: TestedType = ct_opnd2 +  RTZero;
    var res1:TestedType = ct_opnd1;
    var res2:TestedType = rt_opnd1;
    res1%= ct_opnd2;
    0
}