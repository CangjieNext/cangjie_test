/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a20_16_and_bool

  @Level:         1

  @Assertion:    1.4(20) & Bitwise AND

  @Description:  Emit error  bitwise AND (&) with  Bool.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/

type TestedType = Bool;
func BinOp(Operand1:TestedType, Operand2:TestedType): TestedType 
    {Operand1 & Operand2
    }

main(ina :Array<String>) {
    0
}