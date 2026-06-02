/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a03_01

  @Level:         1

  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  Cangjie type 'Bool' may be used in @C structs.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
struct S1 { 
    var fld: Bool
    init(x: Bool) { this.fld = x }
} 

foreign func func_01(x: S1): Bool

main() {
    var St = S1(true)
    let Ret = unsafe{ func_01(St) }
    Assert.isTrue(Ret)
    St.fld = false
    let Ret2 = unsafe{ func_01(St) }
    Assert.isFalse(Ret2)
}