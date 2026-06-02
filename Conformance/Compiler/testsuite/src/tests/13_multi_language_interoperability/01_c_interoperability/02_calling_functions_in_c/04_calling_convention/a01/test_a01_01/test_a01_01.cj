/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a01_01

  @Level:         1

  @Assertion:    13.1.2.4(1) The Cangjie programming language uses the
                 @CallingConv to represent various calling conventions. The
                 supported calling conventions are as follows: 
                 - CDECL, CDECL represents the calling convention used by
                   clang’s C compiler by default on different platforms. 


  @Description:  Check call of foreign function with CDECL calling conventions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@CallingConv[CDECL]
foreign func func_01(x: Int32, ...): Int32

main() {
    var Value : Int32 = unsafe { func_01(3, 222, 111, 3) }
    Assert.equals(336, Value)
}