// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Android) EXEC: %compiler %f -o %output
// (Android) RUN-EXEC: %run %run_opt %output
// (Android) RUN-EXEC: adb shell atrace -a trace_cjrt_test -t 6 -o /data/local/tmp/trace_cjrt_test.log
// (Android) RUN-EXEC: adb shell cat /data/local/tmp/trace_cjrt_test.log | compare %f
// (Android) ASSERT: regex CJ(?:THREAD|RT)
// (iOS) EXEC: %compiler %f -o %output
// (iOS) RUN-EXEC: %run %run_opt %output
// (iOS) RUN-EXEC: xctrace record --template "Logging" --attach trace_cjrt_test --output signpost.trace  --launch --time-limit 6s
// (iOS) RUN-EXEC: stat -f%z signpost.trace| compare %f
// (iOS) ASSERT: regex ^[1-9][0-9]*$

import std.runtime.*
import std.time.*
import std.collection.*

func test(threadId: Int32): Unit {
    println("New thread: {}", threadId)
    for (i in 0..1000) {
        var a = threadId
    }
    sleep(100 * Duration.millisecond)
}

func runMultiThread() {
    let futures = ArrayList<Future<Unit>>(5)
     for (i in 0..5) {
        let future = spawn { => test(Int32(i)) }
        futures.add(future) 
    }
    for (future in futures) {
        future.get()
    }
}

main() {
    runMultiThread()
    gc()
}