/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_a02_01

  @Level:         1
  @Assertion:    15.4(2) • If there are no data races, the value read by a
                 read operation is written by a write operation that is the
                 closest write operation (to the read operation) according to
                 the happens-before order.

                 The memory model addresses the problem of memory visibility in
                 concurrent programming, i.e., when a write operation in one
                 thread becomes visible to another thread.

  @Description:  Checks that memory is safe in case there is no data race

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

var gCounter1:Int64 = 0
var gCounter2:Int64 = 0
var gCounter3:Int64 = 0

func read(i:Int64) {
    match (i) {
        case 0 => gCounter1
        case 1 => gCounter2
        case _ => gCounter3
    }
}

func write(i:Int64, curVal:Int64) {
    match (i) {
        case 0 => gCounter1 = curVal + 1
        case 1 => gCounter2 = curVal + 1
        case _ => gCounter3 = curVal + 1
    }
}

main(): Int64 {
    let threads = 3
    let iterCount = 200
    // consumers
    let starter = ThreadStarter<Int64>(threads){i =>
        return spawn {
            var counter = 0
            while (counter < iterCount) {
                let curVal = read(i)
                sleep(Duration.nanosecond)
                write(i, curVal)
                counter++
            }

            return counter
        }
    }

    // wait for results
    let results = starter.waitAll()

    for (i in 0..threads) {
        Assert.equals(iterCount, read(i), reason: "Global var ${i} should match")

        Assert.equals(iterCount, results[i], reason: "Thread result ${i} should match")
    }
    return 0
}
