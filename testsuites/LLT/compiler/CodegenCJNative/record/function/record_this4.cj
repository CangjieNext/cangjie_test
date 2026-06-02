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
    public var test: Int64 = 2
    public func f(input: Int64) {
        let lambda = {a: Int64 => test - a}
        return lambda(input)
    }
}

main(): Int64 {
    var test = A()
    if (test.f(5) != -3) {
        return 1
    }
    if (test.f(6) != -4) {
        return 1
    }
    return 0
}
