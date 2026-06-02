/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a04_02

  @Level:         1
  @Assertion:    15.1(4) • Threads can communicate with each other via shared
                 memory (where explicit synchronizations are required).

  @Description:  Checks that threads can communicate via shared memory

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.*
import thread_commons.*

let m = Mutex()
var intVar = -1

func debug(str:String):Unit {
    // no-op
}

func release() {
    // release control
    sleep(Duration.nanosecond * 1_000)
}

func producer(iterCount:Int64): Future<Array<Int64>> {
    return spawn {
        debug("producer enter")
        let res = Array<Int64>(iterCount){i => -1}
        var iter = 0
        while (iter < iterCount) {
            if (m.tryLock()) { // lock
                debug("producer lock -> ${iter}")
                if (intVar < 0) {
                    res[iter] = iter
                    iter++
                    intVar = iter
                }
                m.unlock()
                debug("producer unlock -> ${iter}")
                release()
            }
        }
        return res
    }
}

func consumer(iterCount:Int64): Future<Array<Int64>> {
    return spawn {
        debug("consumer enter")
        let res = Array<Int64>(iterCount){i => -1}
        var iter = 0
        while (iter < iterCount) {
            if (m.tryLock()) { // lock
                debug("consumer lock -> ${iter}")
                if (intVar > -1) {
                    res[iter] = intVar
                    iter++
                    intVar = -1
                }
                m.unlock()
                debug("consumer unlock -> ${iter}")
                release()
            }
        }
        return res
    }
}

main(): Int64 {
    let iterCount = 10

    let starter = ThreadStarter<Array<Int64>>([producer(iterCount), consumer(iterCount)])

    // wait for results
    let results = starter.waitAll()

    for (i in 0..iterCount) {
        Assert.equals(i + 1, results[1][i], reason: "Consumer array should have 1-based values ${results[0]}")
        Assert.equals(i, results[0][i], reason: "Producer array should have 0-based values ${results[0]}")
    }
    return 0
}
