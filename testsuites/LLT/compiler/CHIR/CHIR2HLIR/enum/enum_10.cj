// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum TimeUnit<T> {
    Day(T)
}

func run(time: TimeUnit<Int64>): Int64 {
    var time1 = time
    var res = match (time1) {
        case Day(x) => x + 1
    }

    if (res == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    var time = TimeUnit.Day(2)
    return run(time)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
