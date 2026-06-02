/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a04_01

  @Level:         1
  @Assertion:    15.1(4) • Threads can communicate with each other via shared
                 memory (where explicit synchronizations are required).

  @Description:  Checks that threads can communicate via shared memory
                 (synchronized by monitor)

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.*
import thread_commons.*

var intVar = -1

func producer(iterCount:Int64): Future<Array<Int64>> {
     return spawn {
        let res = Array<Int64>(iterCount){i => -1}
 
        let m = Mutex()
        let c = synchronized(m) { m.condition() }
        for (i in 0..iterCount) {
            synchronized (m) {
                while (intVar > -1) {
                    c.wait(timeout:Duration.nanosecond * 1_000);
                }
                res[i] = i
                intVar = i + 1
            }
        }
        res
    }
}
 
func consumer(iterCount:Int64): Future<Array<Int64>> {
    return spawn {
        let res = Array<Int64>(iterCount){i => -1}
 
        let m = Mutex()
        let c = synchronized(m) { m.condition() }
        for (i in 0..iterCount) {
            synchronized (m) {
                while (intVar == -1) {
                    c.wait(timeout:Duration.nanosecond * 1_000);
                }
                res[i] = intVar
                intVar = -1
            }
        }
        res
    }
}

main(): Int64 {
    let iterCount = 10

    let starter = ThreadStarter<Array<Int64>>([consumer(iterCount), producer(iterCount)])

    // wait for results
    let results = starter.waitAll()

    for (i in 0..iterCount) {
        Assert.equals(i + 1, results[0][i], reason: "Consumer array should have 1-based values ${results[0]}")
        Assert.equals(i, results[1][i], reason: "Producer array should have 0-based values ${results[0]}")
    }
    0
}
