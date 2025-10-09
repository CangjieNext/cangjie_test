// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (not Windows) ASSERT: scan [Devirtualization] The function call to foo at [37,9] was optimized.
// (not Windows) ASSERT: scan [Devirtualization] The function call to foo at [43,5] was optimized.

interface CA<T> {
    open func foo(): Unit {}
}

class CB<T> <: CA<T> {
    public func foo(): Unit {}
}

class CC<T> <: CA<T> {
    public func foo(): Unit {}
}

class Test2 {
    public let b: CA<Int64>
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
