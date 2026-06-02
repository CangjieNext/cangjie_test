/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a08_i16

  @Level:         1

  @Assertion:    1.3.1(8) The suffixes in IntegerLiteralSuffix ... 
                  
  @Description:  Compiler checks that number with suffix i16 has type Int16 

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main() {
   Assert.isTrue(0b1010_1010_1i16 is Int16)
   Assert.isTrue(0o010_777i16 is Int16)
   Assert.isTrue(0x0dai16 is Int16)
   Assert.isTrue(5610i16 is Int16)
}
