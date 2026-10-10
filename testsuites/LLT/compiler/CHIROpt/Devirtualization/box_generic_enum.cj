// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic enum E<T> <: I boxed to I; EXACTLY(E<Int64>) -> Apply(inst foo).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Box(
// ASSERT: scan Apply(@_CIN7default1EIG_E3fooHv$l
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I3fooHv

interface I {
    func foo(): Int64
}

enum E<T> <: I {
    | A
    | B(T)
    public func foo(): Int64 {
        match (this) {
            case A => 3
            case B(_) => 4
        }
    }
}

func use(): Int64 {
    var x: I = E<Int64>.A
    x.foo()
}

main() {
    use() - 3
}
