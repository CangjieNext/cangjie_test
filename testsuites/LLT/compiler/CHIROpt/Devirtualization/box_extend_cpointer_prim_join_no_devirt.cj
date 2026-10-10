// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: join EXACTLY(CPointer<UInt8>) and EXACTLY(Int32) must not de-virt.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Box(
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv
// ASSERT: scan-not Apply(CPointer<UInt8>->@_CN7defaultXPh3fooHv
// ASSERT: scan-not Apply(Int32->@_CN7defaultXi3fooHv

interface I {
    func foo(): Int64
}

extend CPointer<UInt8> <: I {
    public func foo(): Int64 {
        2
    }
}

extend Int32 <: I {
    public func foo(): Int64 {
        Int64(this)
    }
}

func use(flag: Bool): Int64 {
    var x: I = CPointer<UInt8>()
    if (flag) {
        x = 1i32
    }
    x.foo()
}

main() {
    use(true) + use(false) - 3
}
