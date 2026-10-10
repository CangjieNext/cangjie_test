// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic struct S<T> <: I<T> boxed to I<Int64> -> Apply(inst S::foo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Box(
// ASSERT: scan Apply(@_CIN7default1SIG_E3fooHv$l
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E3fooHv

interface I<T> {
    func foo(): Int64
}

struct S<T> <: I<T> {
    public func foo(): Int64 {
        5
    }
}

func use(): Int64 {
    var x: I<Int64> = S<Int64>()
    x.foo()
}

main() {
    use() - 5
}
