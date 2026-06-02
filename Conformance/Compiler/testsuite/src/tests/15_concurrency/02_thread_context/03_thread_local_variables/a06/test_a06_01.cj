/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a06_01

  @Level:         1
  @Assertion:    15.2.3(6) If a thread sets a thread-local variable’s value as
                 None, the original value of the thread will be cleaned up.

  @Description:  Checks that ThreadLocal value can be cleaned up by setting None

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095 0006615

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

let a = ThreadLocal<Float64>()

main(): Int64 {
    for (f in [Float64.Inf, Float64.Min, Float64.Max, Float64.NaN, 8888.666f64]) {
        a.set(f)
        Assert.equals(f, a.get().getOrThrow())
    }
    a.set(Option<Float64>.None)
    Assert.isNone<Float64>(a.get())

    return 0
}
