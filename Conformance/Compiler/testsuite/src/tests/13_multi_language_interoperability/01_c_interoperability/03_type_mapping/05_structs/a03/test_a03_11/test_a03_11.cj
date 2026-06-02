/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a03_11

  @Level:         1

  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  Cangjie type 'Float32' may be used in @C structs.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
struct S1 { 
    var fld: Float32
    init(x: Float32) { this.fld = x }
} 

foreign func func_01(x: S1): Float32

main() {
    var St = S1(1.5f32)
    let Ret = unsafe{ func_01(St) }
    Assert.approxEquals(1.5f32, Ret)
    St.fld = 666.666f32
    let Ret2 = unsafe{ func_01(St) }
    Assert.approxEquals(666.666f32, Ret2)
}
