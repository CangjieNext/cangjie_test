// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Time {
    Hour(Bool, Int64)
    | Year(Rune, Int8, Int64)
}

main() {
    var c = Time.Hour(true, 15)
    var d = Time.Year(r'a', 5, 50)
    var res = match (d) {
        case Hour(x, y) => y
        case Year(x, y, z) => z
    }
    res - 50
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
