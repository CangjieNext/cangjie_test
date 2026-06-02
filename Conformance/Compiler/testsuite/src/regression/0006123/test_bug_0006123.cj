/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006123
  @Assertion:        1.4(24) && Logic AND
  @Description:     Compiler emit error that  
                    let ct_opnd2   :  TestedType  =  true
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unused expression
                    although we see it is used twice
  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:         
*/


type TestedType = Bool;
let ct_opnd1   :  TestedType  =  false
let ct_opnd2   :  TestedType  =  true

func BinOp(Operor1:TestedType, Operor2:TestedType): TestedType {
    Operor1 && Operor2
}

main(ina :Array<String>) {
    var RTZero : TestedType =  ina.size == 0
    var rt_opnd1: TestedType = ct_opnd1 &&  RTZero;
    var rt_opnd2: TestedType = ct_opnd2 &&  RTZero;

    BinOp(ct_opnd1 && ct_opnd2,rt_opnd1 && rt_opnd2)
    0
}
