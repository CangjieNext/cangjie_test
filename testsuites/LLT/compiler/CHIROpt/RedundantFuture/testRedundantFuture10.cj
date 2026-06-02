// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [29,5] has been optimised due to redundant future in spawn.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import std.sync.*
internal import std.collection.*

func Run() {
    var futures = ArrayList<Future<Unit>>()

    let longLivedTreeFuture = spawn {
        return 222222
    }

    for (depth in 0..10) {
        var f_temp = spawn {
            var acc = UInt32(0)
        }
        futures.add(f_temp)
    }
    spawn {
        return 11111
    }

    for (f in futures) {
        f.get()
    }
    let longLivedTree = longLivedTreeFuture.get()
}

main(args: Array<String>): Int64 {
    Run()
    return 0
}
