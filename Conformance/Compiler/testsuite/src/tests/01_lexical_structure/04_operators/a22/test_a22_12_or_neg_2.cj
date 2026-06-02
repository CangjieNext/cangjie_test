/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a22_12_or_neg_2

  @Level:         1

  @Assertion:    1.4(22) | Bitwise OR

  @Description:  Emit error if operands have different types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/




func BinOp(Operor1:Int32, Operor2:Int16): Int32 {
    Operor1 | Operor2  // with different types
}

main(ina :Array<String>) {
    0
}
