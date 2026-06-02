/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var result = 0

class A {}

open class C1 {
    public open func f() {
        result = 3
    }

    public func f(a!: Int32 = 0) {
        result = 4
    }

    public open func f(b: Int64) {
        result = 5
    }

    public open func f(a: Bool) {
        result = 6
    }

    public open func f(a: Array<Bool>) {
        result = 7
    }

    public open func f(a: A) {
        result = 8
    }
}

class C2 <: C1 {
    public override func f() {
        super.f()
    }
}

main(): Int64 {
    C2().f()
    return (result - 6)
}
// ASSERT: scan sema_ambiguous_match
