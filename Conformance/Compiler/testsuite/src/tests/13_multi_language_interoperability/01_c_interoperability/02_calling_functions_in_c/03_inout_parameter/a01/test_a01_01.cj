/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a01_01

  @Level:         1

  @Assertion:    13.1.2.3(1) When calling CFunc in Cangjie, the parameter can be
                 modified with the keyword inout to form a pass-by-reference
                 expression, in which case the parameter is passed by reference. 

  @Description:  Simple use of inout modifier.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

import utils.assert.Assert

@C func func_01(Ptr: CPointer<Int32>): Unit {
    let Income = unsafe{ Ptr.read() }
    unsafe{ Ptr.write(Income + 100)}
}

main() {
    var Arg : Int32 = 777;
    unsafe { func_01(inout Arg) }
    Assert.equals(877, Arg)
}
