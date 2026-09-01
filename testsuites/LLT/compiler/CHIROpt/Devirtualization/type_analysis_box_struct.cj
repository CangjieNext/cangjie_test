// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover TypeAnalysis::HandleBoxExpr (struct value boxed to interface).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Box(
// ASSERT: scan Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

struct S <: I {
    public func foo(): Int64 {
        9
    }
}

func use(): Int64 {
    let i: I = S()
    i.foo()
}

main() {
    use() - 9
}
