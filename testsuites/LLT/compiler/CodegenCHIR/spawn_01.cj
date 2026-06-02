// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 10001\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let N = 10000
var g = 1

main(): Int64 {
    let a = spawn {
        => g = 1 + N
    }
    var b = a
    a.get()
    println(g)
    return 0
}
