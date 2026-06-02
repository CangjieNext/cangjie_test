/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a07_01

  @Level:         1

  @Assertion:    13.1.2.2(7)  CFunc is the type corresponding to C’s function
                 pointer type. The type is a generic type. The generic parameter
                 indicates the input parameter and return value type of the CFunc.

  @Description:  Call CFunc from C code.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: CFunc<(Int32)->Int32>, y: Int32): Int32

main() {
    var CB: CFunc<(Int32)->Int32> = { x => 100 + x }
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { func_01(CB, Arg) }
    Assert.equals(877, Value)
}