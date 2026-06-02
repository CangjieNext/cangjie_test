/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a01_02

  @Level:         1

  @Assertion:    13.1.2.2(1)  The CFunc in Cangjie refers to a function that can
                 be called by C code. There are three forms:
                 1. foreign functions modified by @C

  @Description:  CFunc that references foreign function and is called from C.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C foreign func func_01(x: Int32): Int32
@C foreign func func_02(x: CPointer<Unit>, arg: Int32): Int32
main() {
    var CB: CFunc<(Int32)->Int32> = func_01
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { func_02(CPointer<Unit>(CB), Arg) }
    Assert.equals(877, Value)
}