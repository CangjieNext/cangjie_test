// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic struct S<T> <: I; S<Int64> and S<String> both de-virt to inst foo.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default1SIG_E3fooHv$l
// ASSERT: scan Apply(@_CIN7default1SIG_E3fooHv$RNat6StringE
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

struct S<T> <: I {
    public func foo(): Int64 {
        4
    }
}

func useI64(): Int64 {
    var x: I = S<Int64>()
    x.foo()
}

func useStr(): Int64 {
    var x: I = S<String>()
    x.foo()
}

main() {
    useI64() + useStr() - 8
}
