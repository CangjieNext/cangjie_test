// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#4 implementation-relation status branch (generic).
// IsImplementationFunc returns noRelation (L216) when srcFunc.GENERIC differs from
// superFunc.GENERIC, i.e. a generic method and a same-named non-generic method are never an
// implementation relation and are not deduplicated. This case defines both a generic func1<T>
// and a non-generic func1 in the interface, verifying both are independently callable
// (neither is lost due to a misjudged override).
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan generic version
// ASSERT: scan nongeneric version

interface I1 {
    func func1(a: Int64) {
        println("nongeneric version")
    }
    func func1<T>(a: T) {
        println("generic version")
    }
}

class C <: I1 {}

main() {
    let c = C()
    c.func1(1)        // non-generic overload
    c.func1<Int64>(2) // generic version
    0
}
