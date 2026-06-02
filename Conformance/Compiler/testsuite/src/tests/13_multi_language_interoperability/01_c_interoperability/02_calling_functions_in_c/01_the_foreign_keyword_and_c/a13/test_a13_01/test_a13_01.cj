/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a13_01

  @Level:         1

  @Assertion:    13.1.2.1(13) When @C modifies the foreign block, @C is added to
                 each function in the foreign block.

  @Description:  Check call of foreign @C function declared in block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C foreign {
    func func_01(x: Int32): Int32
    func func_02(x: Int32): Int32
}

main() {
    var Value : Int32 = unsafe { func_01(222) }
    Assert.equals(322, Value)
    var Value2 : Int32 = unsafe { func_02(222) }
    Assert.equals(-222, Value2)
}