// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

struct A {
    public A(public let a!: Int64 = 1, public let b!: Int64 = a) {}
}

main(): Int64 {
    var test = A(a: 1, b: 3)
    if (test.b == 3) {
        return 0
    }
    return 1
}
