/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a02_11

  @Level:         1

  @Assertion:    13.1.2.3(2) The pass-by-reference expression is of type
                 CPointer<T>, where T is the type of the expression that
                 the inout expression modifies.

  @Description:  Use of inout modifier for parameter of type Float32.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

import utils.assert.Assert

@C func func_01(Ptr: CPointer<Float32>): Unit {
    let Income = unsafe{ Ptr.read() }
    Assert.equals(1.41421356237f32, Income)
    unsafe{ Ptr.write(-3.14159265359f32) }
}

main() {
    var Arg : Float32 = 1.41421356237f32;
    unsafe { func_01(inout Arg) }
    Assert.equals(-3.14159265359f32, Arg)
}
