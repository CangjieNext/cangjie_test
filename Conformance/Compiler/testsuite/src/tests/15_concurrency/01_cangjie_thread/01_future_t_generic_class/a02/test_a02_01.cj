/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a02_01

  @Level:         1
  @Assertion:    15.1.1(2) The type T depends on the return type of the closure
                 in the spawn expression.

  @Description:  Checks that type T corresponds to return type

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

main(): Int64 {
    let f1 = spawn {
    }
    Assert.isTrue(f1 is Future<Unit>)
    Assert.isTrue(f1.get() is Unit)

    let f2 = spawn {
        return (12i8, 2.0e18f64)
    }
    Assert.isTrue(f2 is Future<(Int8, Float64)>)
    Assert.isTrue(f2.get() is (Int8, Float64))

    0
}
