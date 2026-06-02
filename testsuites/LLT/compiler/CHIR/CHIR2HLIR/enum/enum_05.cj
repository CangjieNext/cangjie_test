// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Time {
    Date
    | Month
    | Hour(Bool, Int64)
}

main() {
    var b = Time.Date
    var d = Time.Month
    var c = Time.Hour(true, 15)
    var res = match (b) {
        case Hour(x, y) => y
        case Date => -5
        case Month => 10
    }
    res + 5
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
