// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class C {}

struct A<T> where T <: C {
    public var C: Int64 = 1
    public var T: Int64 = 2
    public var A: Int64 = 3
}

main() {
    var b = A<C>()
    if (b.C == 1 && b.T == 2 && b.A == 3) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
