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
// ASSERT: scan result = 100\n
internal import std.sync.*

main(): Int64 {
    var fut = spawn {
        print("task Sleep 1s\n")
        sleep(Duration.second)
        print("task Sleep Done\n")
        return 100
    }
    var result: Int64 = 0
    try {
        result = fut.get()
    } catch (e: Exception) {
        e.printStackTrace()
    }
    print("result = ${result}\n")
    return 0
}
