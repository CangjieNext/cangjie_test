// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan task Sleep 1s\n
// ASSERT: scan task Sleep Done\n
// ASSERT: scan catch exception\n
main(): Int64 {
    var fut = spawn {
        print("task Sleep 1s\n")
        sleep(Duration.second)
        print("task Sleep Done\n")
        throw Exception("oops")
        return 100
    }
    try { // Join the thread
        fut.get()
    } catch (_) {}

    try {
        let result: Option<Int64> = fut.tryGet()
    } catch (_) {
        print("catch exception\n")
    }
    return 0
}
