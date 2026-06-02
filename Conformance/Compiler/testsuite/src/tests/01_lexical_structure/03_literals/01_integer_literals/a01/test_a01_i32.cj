/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a01_i32

  @Level:         1

  @Assertion:    1.3.1(1) Integer literals can be written in four bases: binary, octal, decimal, and hexadecimal
                  
  @Description:  Check that integer number with type i32 folded correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
   Assert.equals(987661162,987661162i32)
   Assert.equals(98766116i32,(0b101111000110000110100100100_i32))
   Assert.equals(0o1374456756_i32,0xBF25DEE_i32)
   Assert.equals(0xbf25dee_i32,0xBF25DEE_i32)

}
