// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Time<T> {
    Date
    | Hour(Bool, T)
    | Year(Rune, Int8, T)
}

main() {
    var b = Time<Int64>.Date;
    var c = Time<Int64>.Hour(true, 9)
    var d = Time<Int64>.Year(r'a', 5, 50)
    var res = match (c) {
        case Hour(x, y) => y
        case Date => -5
        case Year(x, y, z) => z
        case _ => -1
    }
    res - 9
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
