// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 19\npass

struct S1 {
    var a = Option<(Int64, S1)>.None
    var b = -1
    init() {}
    init(x: Option<(Int64, S1)>) {
        a = x
        b = 30
    }
}

main() {
    var s = S1(Option<(Int64, S1)>.Some((19, S1())))
    match (s.a) {
        case Some(v) =>
            println(v[0]);
            match (v[1].a) {
                case Some(vv) => println(vv[0])
                case None => println("pass")
            }
        case None => println(s.b)
    }
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
