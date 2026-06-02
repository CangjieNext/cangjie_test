/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a04_01

  @Level:         1
  @Assertion:    15.1.1(4) A Future<T> object represents an incomplete
                 computation or task.

  @Description:  Checks that long-running computation can be incomplete

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

let result:Int64 = 0x29A
var blocked = true

main(): Int64 {
    let f: Future<Int64> = spawn {
        while (blocked) {
            sleep(Duration.nanosecond * 10)
        }
        return result
    }

    sleep(Duration.nanosecond * 1000)

    Assert.isNone(f.tryGet())

    blocked = false

    Assert.equals(result, f.get())

    return 0
}
