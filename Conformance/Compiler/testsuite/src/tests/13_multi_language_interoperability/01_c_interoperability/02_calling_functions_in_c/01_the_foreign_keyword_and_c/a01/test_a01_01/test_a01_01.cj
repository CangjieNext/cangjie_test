/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a01_01

  @Level:         1

  @Assertion:    13.1.2.1(1) If we want to call C functions in Cangjie language,
                 the function should be declared in Cangjie and modified by
                 foreign keyword.

  @Description:  Check call of foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int16): Int16

main() {
    var Value : Int16 = unsafe { func_01(222) }
    Assert.equals(322, Value)
}