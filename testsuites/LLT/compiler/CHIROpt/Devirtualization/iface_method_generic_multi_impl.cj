// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: IIface param with method-level generic compute<T> stays Invoke (multiple
// impls C1/C2); must not Apply to a single concrete C1::compute even when T is Int64.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_1IE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I7computeIG_Hv
// ASSERT: scan-not Apply(Class-_CN7default2C1E&->@_CN7default2C17computeIG_Hv
// ASSERT: scan-not Apply(Class-_CN7default2C2E&->@_CN7default2C27computeIG_Hv

interface I {
    func compute<T>(): Int64
}

class C1 <: I {
    public func compute<T>(): Int64 {
        let _: Option<T> = Option<T>.None
        1
    }
}

class C2 <: I {
    public func compute<T>(): Int64 {
        let _: Option<T> = Option<T>.None
        2
    }
}

func use(i: I): Int64 {
    i.compute<Int64>()
}

main(): Int64 {
    use(C1()) + use(C2()) - 3
}
