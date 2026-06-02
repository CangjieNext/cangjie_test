// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct rA {
    public let a: Int64 = 2
    public let b: Int64 = 3
    public func f1() {
        return a + 4
    }
}

main(): Int64 {
    var test = rA()
    if (test.a != 2) {
        return 1
    }
    if (test.b != 3) {
        return 2
    }
    if (test.f1() != 6) {
        return 5
    }
    return 0
}
