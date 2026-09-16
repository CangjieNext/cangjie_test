// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: join of EXACTLY(S1) and EXACTLY(S2) on interface var must not de-virt.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHb" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Box(
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv
// ASSERT: scan-not Apply(Struct-_CN7default2S1E->@_CN7default2S13fooHv
// ASSERT: scan-not Apply(Struct-_CN7default2S2E->@_CN7default2S23fooHv

interface I {
    func foo(): Int64
}

struct S1 <: I {
    public func foo(): Int64 {
        1
    }
}

struct S2 <: I {
    public func foo(): Int64 {
        2
    }
}

func use(flag: Bool): Int64 {
    var x: I = S1()
    if (flag) {
        x = S2()
    }
    x.foo()
}

main() {
    use(true) + use(false) - 3
}
