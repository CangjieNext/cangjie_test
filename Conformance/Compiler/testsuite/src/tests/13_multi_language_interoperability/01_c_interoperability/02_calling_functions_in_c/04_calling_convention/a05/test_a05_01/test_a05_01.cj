/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a05_01

  @Level:         1

  @Assertion:    13.1.2.4(5) The @CallingConv can only be used to modify foreign
                 block, single foreign function, CFunc function in the top-level
                 scope.

  @Description:  @CallingConv on single foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@CallingConv[CDECL]
foreign func func_01(): Int32 

main() {
    var Res: Int32 = unsafe{ func_01() }
    Assert.equals(666i32, Res)
}
