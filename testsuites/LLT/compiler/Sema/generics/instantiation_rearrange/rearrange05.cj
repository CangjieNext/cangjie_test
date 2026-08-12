// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-2 add in C1

interface I {}
abstract class C1<T> <: I where T <: I {
    public open func add(child: T) {
        println("add in C1")
    }
}

enum E <: I {
    | EE
}

class C2 <: C1<E> {
    public func add(a: I): Unit {
        println("add in C2")
    }
    public func add1() {
        let a = E.EE
        this.add(a)
    }
}

main() {
    C2().add(E.EE)
    C2().add1()
}