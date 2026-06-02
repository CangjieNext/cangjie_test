/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a21_12_xor_neg_2

  @Level:         1

  @Assertion:    1.4(21) ^ Bitwise XOR

  @Description:  Emit error if operands have different types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/




func BinOp(Operxor1:Int32, Operxor2:Int16): Int32 {
    Operxor1 ^ Operxor2  // with different types
}

main(ina :Array<String>) {
    0
}
