// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan operator func () of struct A
struct A {
    public operator func ()() {
        print("operator func () of struct A\n")
    }
}

func run() {
    var a = A()
    a()
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
