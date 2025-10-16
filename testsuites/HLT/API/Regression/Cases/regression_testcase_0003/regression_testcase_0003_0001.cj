/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.convert.*
import std.collection.*
import std.time.*
import std.runtime.*

var shouldLog = false
var blackBox = WorkloadObject(-1)

class CountDownLatch {
    let m = Monitor()
    var counter = 0

    init(N: Int64) {
        counter = N
    }

    func countDown() {
        synchronized(m) {
            if (counter == 0) {
                violation()
            }

            counter = counter - 1

            if (counter == 0) {
                m.notifyAll()
            }
        }
    }

    func await() {
        synchronized(m) {
            while (counter != 0) {
                m.wait()
            }
        }
    }

    func currentCounter() {
        synchronized(m) {
            return counter
        }
    }
}

// consider experimenting with workload of warying size classes
class WorkloadObject {
    let data: Int64

    init(x: Int64) {
        data = x
    }
}

func violation() {
    throw Exception("Should not reach here!")
}

func startWorker(cdl: CountDownLatch, N: Int64) {
    let f: Future<Unit> = spawn {
        cdl.countDown()
        cdl.await()
        GC()
        sleep(Duration.second * 2)
    }

    return f
}

func measure(w: Int64, N: Int64): Unit {
    let cdl = CountDownLatch(w + 1)
    let workers = ArrayList<Future<Unit>>()
    for (i in 0..w) {
        let f = startWorker(cdl, N)
        workers.add(f)
    }

    // consider reworking this busy loop
    while (cdl.currentCounter() != 1) {
        sleep(Duration.millisecond)
    }

    cdl.countDown()
    for (f in workers) {
        GC()
        sleep(Duration.second)
        f.get() // join all workers
    }
}

main(args: Array<String>): Unit {
    measure(8, 1000000)
}
