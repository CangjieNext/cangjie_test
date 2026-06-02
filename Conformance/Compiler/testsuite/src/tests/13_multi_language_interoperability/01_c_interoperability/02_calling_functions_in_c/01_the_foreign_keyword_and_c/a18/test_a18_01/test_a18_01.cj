/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a18_01

  @Level:         1

  @Assertion:    13.1.2.1(18) foreign function allows variable-length arguments,
                 which is described by ... as the last one in parameter list.

  @Description:  Check call of foreign function with variable-length arguments.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int32, ...): Int32

main() {
    var Value : Int32 = unsafe { func_01(3, 1, 22, 333) }
    Assert.equals(356, Value)
}