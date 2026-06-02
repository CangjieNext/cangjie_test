/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_08_a02_01

  @Level:         1

  @Assertion: 4.8(2)
              The type of the expression being converted is not affected by the target type. See Type Conversion for
              more details.  

  @Description: Check that type of the expression being converted is not affected by the target type.

  @Mode: run

  @Negative: no

  @Issue: 0006422

*/

// NOTE: Well, the check is going to be tricky. Check that type conversion acts like a function. Function invocation
//       does not affect its argument type, so type conversion should behaves in the same way.

// NOTE: Well, it is a bit strange assertion with a quite strange check.

import utils.assert.Assert

main() {
    var f1: (Int64) -> UInt64 = { x => UInt64(x) }
    var f2: (Float64) -> UInt64 = { x => UInt64(x) }
    var f3: (UInt64) -> Int32 = { x => Int32(x) }

    Assert.equals(100, f1(100))
    Assert.equals(200, f2(200.0))
    Assert.equals(300, f3(300))
}

