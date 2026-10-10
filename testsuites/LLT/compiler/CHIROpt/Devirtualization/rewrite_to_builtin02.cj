// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1AE&->@_CN7defaultXCNY_1AE4nextHl
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7defaultXCNY_1AE4nextHl

func TestNext<T>(a: Countable<T>): Int64 {
    let _ = a.next(0)
    a.position()
}

class A {}

extend A <: Countable<A> {
    public func position(): Int64 {
        0
    }
    public func next(right: Int64): A {
        A()
    }
}

main() {
    // Avoid Int64.next rewrite path that currently produces invalid CHIR (ThisType mismatch).
    TestNext(A()) - 0
}
