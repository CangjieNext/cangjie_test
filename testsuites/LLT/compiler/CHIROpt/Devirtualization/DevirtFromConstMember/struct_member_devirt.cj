// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [37,9] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [43,5] was optimized.

interface CA {
    open func foo(): Unit {}
}

struct CB <: CA {
    public func foo(): Unit {}
}

class CC <: CA {
    public func foo(): Unit {}
}

struct Test2 {
    public let b: CA
    init() {
        b = CB()
    }
    init(i: Int64) {
        if (i > 3) {
            b = CB()
        } else {
            b = CB()
        }
    }
    func hoo() {
        b.foo()
    }
}

main() {
    let t = Test2()
    t.b.foo()
}
