/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a05_01

  @Level:         1
  @Assertion:    15.2.3(5) Accessing methods get/set can read/write the value
                 of a thread-local variable.

  @Description:  Checks that ThreadLocal can be written/read by the same thread

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

let a = ThreadLocal<Float32>()

main(): Int64 {
    for (f in [Float32.Inf, Float32.Min, Float32.Max, Float32.NaN, 8.666f32]) {
        a.set(f)
        Assert.equals(f, a.get().getOrThrow())
    }
    let fut1: Future<Unit> = spawn {
        Assert.isNone<Float32>(a.get())
    }

    return 0
}
