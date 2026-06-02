/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a02_01

  @Level:         1

  @Assertion:    13.1.2.4(2)
                 - STDCALL, STDCALL represents the calling convention used by
                   the Win32 API.


  @Description:  Check call of foreign function with STDCALL calling conventions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@CallingConv[CDECL]
foreign func func_01(x: Int16): Int16

main() {
    var Value : Int16 = unsafe { func_01(222) }
    Assert.equals(322i16, Value)
}
