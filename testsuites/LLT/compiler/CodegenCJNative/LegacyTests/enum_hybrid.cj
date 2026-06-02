// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit1 {
    Hour
    | Day(Int32)
}

enum TimeUnit2 {
    Month(TimeUnit1)
}

func codegenUnitTest(): Int32 {
    var time1 = TimeUnit2.Month(Hour)
    time1 = TimeUnit2.Month(TimeUnit1.Hour)
    var time2 = TimeUnit2.Month(Day(5))
    var time3 = TimeUnit2.Month(TimeUnit1.Day(60))
    var res: Int32 = match (time1) { // 1
        case Month(Hour) => 1
        case Month(Day(5)) => 10
        case Month(Day(x)) => x * 10
    } + match (time2) { // 10
        case Month(Hour) => 1
        case Month(Day(5)) => 10
        case Month(Day(x)) => x * 10
    } + match (time3) { // 600
        case Month(Hour) => 1
        case Month(Day(5)) => 10
        case Month(Day(x)) => x * 10
    }
    return res
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 611) {
        return 0
    } else {
        return -1
    }
}
