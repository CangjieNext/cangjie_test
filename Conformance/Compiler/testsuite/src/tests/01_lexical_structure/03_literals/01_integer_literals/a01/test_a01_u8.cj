/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a01_u8

  @Level:         1

  @Assertion:    1.3.1(1) Integer literals can be written in four bases: binary, octal, decimal, and hexadecimal
                  
  @Description:  Check that integer number with type u8 folded correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
   Assert.equals(255u8,0b11111111_u8)
   Assert.equals(0o377u8,0b11111111_u8)
   Assert.equals(0xFFu8,0b11111111_u8)

}
