// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 5\n10\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum ABC {
    CASE1
    | CASE2(Int64, Bool, Int64)
    | CASE3(Int32)
}

main() {
    let a = ABC.CASE2(9, false, 1)
    let tu = (ABC.CASE3(6), a)
    var b = match (tu[0]) {
        case CASE1 => 1
        case CASE2(x, y, z) =>
            if (y) {
                x - z
            } else {
                x + z
            }
        case _ => 5
    }
    println(b) // 5
    b = match (tu[1]) {
        case CASE1 => 1
        case CASE2(x, y, z) =>
            if (y) {
                x - z
            } else {
                x + z
            }
        case _ => 5
    }
    println(b) // 10
}
