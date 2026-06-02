/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a01_i8

  @Level:         1

  @Assertion:    1.3.1(1) Integer literals can be written in four bases: binary, octal, decimal, and hexadecimal
                  
  @Description:  Check that integer number with type i8 folded correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
   Assert.equals(55i8,0b110111_i8)
   Assert.equals(0o37i8,0b11111_i8)
   Assert.equals(0x1Fi8,0b11111_i8)

}
