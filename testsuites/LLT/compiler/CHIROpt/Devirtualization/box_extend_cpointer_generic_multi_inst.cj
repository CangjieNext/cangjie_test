// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: same generic extend<T> CPointer<T> <: I, two type args (UInt8 / Int64) both de-virt.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXPG_3fooHv$h
// ASSERT: scan Apply(@_CIN7defaultXPG_3fooHv$l
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

extend<T> CPointer<T> <: I {
    public func foo(): Int64 {
        4
    }
}

func useU8(): Int64 {
    var x: I = CPointer<UInt8>()
    x.foo()
}

func useI64(): Int64 {
    var x: I = CPointer<Int64>()
    x.foo()
}

main() {
    useU8() + useI64() - 8
}
