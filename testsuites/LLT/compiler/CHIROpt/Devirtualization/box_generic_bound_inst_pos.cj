// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: virtual go<T>(x: T) where T <: I; exact R + T=S instantiates the
// callee and rewrites Invoke to Apply(inst go).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default1R2goIG_HG_$RN7default1SE
// ASSERT: scan-not Invoke(Class-_CN7default6RunnerE&->@_CN7default6Runner2goIG_HG_

interface I {
    func foo(): Int64
}

struct S <: I {
    public func foo(): Int64 {
        6
    }
}

interface Runner {
    func go<T>(x: T): Int64 where T <: I
}

class R <: Runner {
    public func go<T>(x: T): Int64 where T <: I {
        x.foo()
    }
}

func use(): Int64 {
    var r: Runner = R()
    r.go(S())
}

main() {
    use() - 6
}
