/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var result = 0

class A {}

open class C1 {
    public open func f() {
        result = result + 3
    }

    public open func f(a: Int32) {
        result = result + 4
    }

    public open func f(b: Int64) {
        result = result + 5
    }

    public open func f(a: Bool) {
        result = result + 6
    }

    public open func f(a: Array<Bool>) {
        result = result + 7
    }

    public open func f(a: A) {
        result = result + 8
    }
}

class C2 <: C1 {
    public override func f() {
        super.f()
        super.f(0)
        super.f(true)
        super.f(A())
    }
}

main(): Int64 {
    C2().f()
    return (result - 22)
}
