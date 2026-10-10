// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: extend S <: I<Int64> & I<String>; both boxes -> Apply(S::foo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-2 Apply(Struct-_CN7default1SE->@_CN7defaultXRNY_1SE3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Struct-_CNat6StringE>&->@_CN7default1IIG_E3fooHv

interface I<T> {
    func foo(): Int64
}

struct S {}

extend S <: I<Int64> & I<String> {
    public func foo(): Int64 {
        5
    }
}

func use(): Int64 {
    var a: I<Int64> = S()
    var b: I<String> = S()
    a.foo() + b.foo()
}

main() {
    use() - 10
}
