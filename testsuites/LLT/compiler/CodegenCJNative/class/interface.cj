// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I1 {
    func f1(): Int64
}

interface I2 {
    func f2(): Int64
}

class C <: I1 & I2 {
    public func f1(): Int64 {
        return 1
    }
    public func f2(): Int64 {
        return 2
    }
}

main() {
    let x: I2 = C()
    let f = x.f2
    if (f() == 2) {
        return 0
    }
    return 1
}
