// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 21\n19

struct S1 {
    var a: (Int64, Option<S1>) = (19, Option<S1>.None)
    var b = 5
    init(x: (Int64, Option<S1>)) {
        a = x
    }
    init(y: Int64) {
        b = y
    }
}

main() {
    var s = S1((17, S1(21)))
    match (s.a[1]) {
        case Some(v) =>
            println(v.b);
            println(v.a[0])
        case None => println("None")
    }
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
