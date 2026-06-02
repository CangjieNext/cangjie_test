// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface C {
    func f(): Int64
}

struct B {}

extend B <: C {
    public func f(): Int64 {
        11
    }
}

main() {
    var a: C = B()
    var m = match (a) {
        case c: B => c.f()
        case _ => 13
    }
    if (m == 11) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
