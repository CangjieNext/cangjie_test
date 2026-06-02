/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_a03_01

  @Level:         1

  @Assertion:    13.1.3(3)
                 Complex foreign types include structs modified by
                 @C and CFunc.

  @Description:  Using struct in С interface.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      This assert is checked in tests for "13.1.3.3 String",
                 "13.1.3.4 Struct" and "13.1.3.5 Function".

  @Issue: 0006421
*/

import utils.assert.Assert

@C
struct Point2D {
    var x: Int32 = 0
    var y: Int32 = 0
}

foreign func func_01(): Point2D

main() {
    let Val = unsafe{ func_01() }
    Assert.equals(666, Val.x)
    Assert.equals(-77, Val.y)
}