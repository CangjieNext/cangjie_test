/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a17_09

  @Level:         1

  @Assertion:    1.4(17) >= Greater than or equal
 
  @Description:  Emit error with incorrect greater or equal operator

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/

type TestedType = IntNative;
let ct0        :  TestedType  =  0
let ct_opnd1   :  TestedType  =  3
let ct_opnd2   :  TestedType  = -2

var RTZero : TestedType =  ct_opnd1;

func BinOp(Operand1:TestedType, Operand2:TestedType): Bool 
    {Operand1 .>= Operand2       // >=   incorrect  greater or equal sign
    }

main(ina :Array<String>) {
    0
}