// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: const member type fact enables TryInvoke -> TryApply.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_6HolderE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan TryApply(Class-_CN7default4ImplE&->@_CN7default4Impl3fooHv
// ASSERT: scan-not TryInvoke(

interface I {
    func foo(): Int64
}

class Impl <: I {
    public func foo(): Int64 {
        9
    }
}

class Holder {
    public let m: I = Impl()
}

func use(h: Holder): Int64 {
    try {
        h.m.foo()
    } catch (_: Exception) {
        0
    }
}

main() {
    use(Holder()) - 9
}
