/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:     13_01_03_05_a01_01

  @Level:         1

  @Assertion:    13.1.3.5(1)  When the foreign function signature contains
                 struct type, you need to define corresponding struct with
                 the same memory layout in Cangjie side, which is
                 modified by @c.

  @Description:  Foreign function returns struct.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

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