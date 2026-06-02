// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 200
// ASSERT: scan 300.000000

struct S<T> {
    public var a: Int32 = 100
    public var b: Float32 = 200.0
    public S() {
        a = 200
        b = 300.0
    }
    public init(a: Int32) {
        this()
    }
}

main() {
    var s = S<Int64>(5)
    println(s.a)
    println(s.b)
    return 0
}
