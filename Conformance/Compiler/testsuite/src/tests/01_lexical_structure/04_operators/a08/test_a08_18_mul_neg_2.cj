/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a08_18_mul_neg_2

  @Level:         1

  @Assertion:    1.4(8) * Multiply

  @Description:  Emit error if operands have different types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/



type TestedType = IntNative;

func BinOp(Operand1:Float16, Operand2:Int16)
    {Operand1 * Operand2  // mul with different types
     0
    }

main(ina :Array<String>) {
    0
}
