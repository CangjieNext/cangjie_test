/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.time.*
import std.collection.*
import std.math.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}

public func getTime(): Float64 {
    let time = DateTime.now()
    return Float64(time.second) * 1000.0 + Float64(time.nanosecond) / 1000000.0
}

func foo(): Float64 {
    var x: Float64 = 0.0
    for (i in 0..30000000) {
        x = (Float64(i) + 0.5) * (Float64(i) + 0.5)
    }
    return x
}

main() {
    var timer = Timer()
    timer.start()

    for (i in 0..10) {
        var result = foo()
    }
    var time = timer.stop()
    println("Forlooper_Obj:\t ${Float64(time.toNanoseconds())/1000000.0}\tms");
}
