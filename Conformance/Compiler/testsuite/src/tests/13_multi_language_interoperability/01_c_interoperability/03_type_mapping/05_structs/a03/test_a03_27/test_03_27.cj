/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  @c struct may be used in @c structs.
  @Level:         1

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@C
struct S1 {
    var f1: Int32 = 0
}

@C
struct S2 { 
    var fld: S1
    init() { this.fld = S1() }
} 

foreign func func_01(): S2

main() {
    var St: S2 = unsafe{ func_01() }
    Assert.equals(12345, St.fld.f1)
}
