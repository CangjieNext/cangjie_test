/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        bug_0005878_03

  @Assertion:   0005878: Hexadecimal representation, a floating point number computes wrong.
  
  @Description: Error demo: float hex representation folded incorrectly

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/
import utils.assert.Assert

main() {
    Assert.equals(0x2.1p1,2.1*2.0) 
    Assert.equals(0xA.4p-1,10.4/2.0)
}
