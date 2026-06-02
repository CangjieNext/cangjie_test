/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_03_a01_01

  @Level:         1
  @Assertion:    15.1.3(1) If the closure corresponding to thread completes,
                 the thread is terminated automatically.

  @Description:  Checks that no computations happens after return from closure.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

var result:Int64 = 0

main(): Int64 {
    let f: Future<Int64> = spawn {
        for (i in 0..10) {
            result++
            if (result > 7) {
                return result
            }
        }
        // this code should never be executed
        while (true) {
            result++
        }
        return result
    }

    Assert.equals(8, f.get())

    sleep(Duration.nanosecond * 100_000) // pause main thread

    Assert.equals(8, result)

    return 0
}
