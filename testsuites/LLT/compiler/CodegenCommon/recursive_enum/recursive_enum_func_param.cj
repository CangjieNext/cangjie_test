// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan None\n5\n5

struct S1 {
    var a = Option<S1>.None
    var b = 5
}

struct S2 {
    var k = Option<S1>.Some(S1())
}

func foo(x: Option<S1>) {
    match (x) {
        case Some(s) => println(s.b)
        case None => println("None")
    }
}

main() {
    var s1 = S1()
    var val = Option.Some(s1)
    foo(s1.a)
    s1.a = val
    foo(s1.a)
    foo(S2().k)
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
