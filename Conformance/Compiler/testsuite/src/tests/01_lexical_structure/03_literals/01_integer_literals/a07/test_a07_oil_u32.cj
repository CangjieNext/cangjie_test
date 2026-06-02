/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a07_oil_u32

  @Level:         1

  @Assertion:   1.3.1(7) The syntax of integer literals
                  
  @Description:  Check that octal number with type u32 folded correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
   Assert.equals(0O6001771177u32, 0b110000000001111111001001111111) 
}
