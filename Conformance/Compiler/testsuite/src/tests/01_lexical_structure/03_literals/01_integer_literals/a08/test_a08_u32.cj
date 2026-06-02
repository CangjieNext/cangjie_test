/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a08_u32

  @Level:         1

  @Assertion:    1.3.1(8) The suffixes in IntegerLiteralSuffix ... 
                  
  @Description:  Compiler checks that number with suffix u32 has type UInt32 

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main() {
   Assert.isTrue(0b1010_1010_1u32 is UInt32)
   Assert.isTrue(0o1010_777u32 is UInt32)
   Assert.isTrue(0x1a10da_1u32 is UInt32)
   Assert.isTrue(5610u32 is UInt32)
}
