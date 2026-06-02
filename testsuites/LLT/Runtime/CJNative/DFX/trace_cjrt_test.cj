// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Android) EXEC: %compiler %cmp_opt %f -o %output
// (Android) RUN-EXEC: %run %run_opt %output & sleep 0.5s && atrace -a "*" -t 8 -o /data/local/tmp/trace_cjrt_test.log && cat /data/local/tmp/trace_cjrt_test.log | compare %f
// (Android) ASSERT: regex CJ(?:THREAD|RT)
// (iOS) EXEC: %compiler %cmp_opt %f -o %output
// (iOS) RUN-EXEC: %run %run_opt %output
// (iOS) EXEC: timeout 8s xctrace record --template "Logging"  --attach ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --device ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} --output signpost.trace & sleep 0.5s && xcrun simctl launch --console-pty --terminate-running-process ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST}
// (iOS) EXEC: du -sh signpost.trace | awk '{print $1}' | compare %f
// (iOS) ASSERT: regex ^[1-9][0-9]*(\.[0-9]+)?[MK]$

import std.runtime.*
import std.time.*
import std.collection.*

func test(threadId: Int32): Unit {
    println("New thread: ${threadId}")
    var sum = 0
    for (i in 0..1000) {
        var a = threadId
        sum += i
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
    sleep(3 * Duration.second)
    runMultiThread()
    sleep(3 * Duration.second)
    gc()
}