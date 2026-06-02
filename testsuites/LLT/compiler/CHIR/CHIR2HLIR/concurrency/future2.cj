// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan no result\n
internal import std.sync.*

main(): Int64 {
    let flag = AtomicBool(true)
    var fut = spawn {
        while (flag.load()) {
            print("task Sleep 1s\n")
            sleep(Duration.second)
            print("task Sleep Done\n")
        }
        return 100
    }
    let result: Option<Int64> = fut.tryGet()
    match (result) {
        case Some(v) => print("result = ${v}\n")
        case None => print("no result\n")
    }
    flag.store(false)
    return 0
}
