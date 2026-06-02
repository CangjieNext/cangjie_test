/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output
// TIMEOUT: 1000

import std.sync.*
import std.time.*
import std.convert.*
import std.runtime.*
import std.argopt.*
import std.process

var reps: Int64 = 300

class WaitGroup {
    var m: Monitor = Monitor()
    private var cnt: Int64

    public init(cnt: Int64) {
        this.cnt = cnt
    }

    public func add(n: Int64) {
        m.lock()
        cnt += n
        if (cnt == 0) {
            m.notifyAll()
        } else if (cnt < 0) {
            throw Exception("negative WaitGroup counter")
        }
        m.unlock()
    }

    public func done() {
        this.add(-1)
    }

    public func wait() {
        m.lock()
        while (cnt > 0) {
            m.wait()
        }
        m.unlock()
    }
}

func benchmarkCreateThreadsCapture(reps: Int64) {
    for (i in 0..reps) {
        let N: Int64 = 4
        let wg = WaitGroup(0)
        wg.add(N)

        for (j in 0..N) {
            spawn {
                if (j >= N) {
                    println("bad")
                }
                wg.done()
            }
        }
        wg.wait()
    }
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    benchmarkCreateThreadsCapture(reps)
    endTime = DateTime.now()
    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    print(perTime.format(".2") + " ns/op\n")

    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.millisecond * 200)
    }
    return 0
}
