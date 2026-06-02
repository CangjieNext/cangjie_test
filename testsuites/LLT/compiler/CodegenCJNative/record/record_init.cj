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
    public var a: String = "du"
    public init(a!: String = "b") {
        this.a = a
    }
    public init(x: Int64) {
        this(a: "c")
        a = "123"
    }
    public init(x: Float64) {
        this()
    }
}

main(): Int64 {
    if (A().a == "b" && A(3.2).a == "b" && A(3).a == "123") {
        return 0
    }
    return 1
}
