/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_02_a04_fpl_1

  @Level:         1

  @Assertion:    1.3.2(4) 
                 In the hexadecimal representation, a floating point number must contain at least one 
                 integer part or fractional part and must contain an exponential part (prefixed with p or P).
  @Description:  Check float numbers are written correctly

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert
main() {
    Assert.isTrue(0Xcp1    > 0.0)   //integer part
    Assert.isTrue(0x.1p1   > 0.0)  //fractional part
    Assert.isTrue(0xA.BP-10> 0.0)  // integer & fractional part
    0
}
