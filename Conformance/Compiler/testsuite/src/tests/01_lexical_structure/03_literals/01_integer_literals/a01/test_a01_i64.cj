/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a01_i64

  @Level:         1

  @Assertion:    1.3.1(1) Integer literals can be written in four bases: binary, octal, decimal, and hexadecimal
                  
  @Description:  Check that integer number with type i64 folded correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
   Assert.equals (70453305375603164i64, 0b11111010010011001110100001110000001010100011100111011100_i64)
   Assert.equals (0O3722316416012434734i64, 0b11111010010011001110100001110000001010100011100111011100_i64)
   Assert.equals (0xFA4CE8702A39DCi64, 0b11111010010011001110100001110000001010100011100111011100_i64)
}
