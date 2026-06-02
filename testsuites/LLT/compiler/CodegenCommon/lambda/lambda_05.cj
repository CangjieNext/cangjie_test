// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f

class A {
    public func say() {
        println("A")
    }
}

open class J {
    public open func say() {
        println("J")
    }
}

class H <: J {
    public func say() {
        println("H")
    }
}

open class M {
    public open func say() {
        println("M")
    }
}

class N <: M {
    public func say() {
        println("N")
    }
}

main() {
    let f: ((Object) -> Int32) = {
        x: Object =>
        println("A");
        0
    }
    let g: ((A) -> Int32) = f
    g(A()) // ASSERT: scan-begin A

    let h: ((J) -> Int64) = {
        x: J =>
        println("H <: J");
        x.say();
        0
    }
    let j: ((H) -> Int64) = h
    j(H()) // ASSERT: scan-next H <: J

    // ASSERT: scan-next H
    let m: ((M) -> Int64) = {
        x: M =>
        println("N <: M");
        x.say();
        0
    }
    let n: ((N) -> Int64) = m
    n(N()) // ASSERT: scan-next N <: M

    // ASSERT: scan-next N
    return 0
}
