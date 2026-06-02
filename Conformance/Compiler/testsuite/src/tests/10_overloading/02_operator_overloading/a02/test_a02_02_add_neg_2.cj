/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a02_02_add_neg_2

  @Level:         1

  @Assertion:    10.2(2) By default, the type of operands for an operator can only
                 be of specific types, e.g., the operand of an arithmetic operator
                 can only be numeric types, and the operand of a logical operator 
                 can only be of Booltype.
  
  @Description:  + can be only with numeric type. Emit error

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/



func BinOp(Operand1:Bool, Operand2:Bool)
    {Operand1 + Operand2  // add with different types
    0
}

main(ina :Array<String>) {
    0
}
