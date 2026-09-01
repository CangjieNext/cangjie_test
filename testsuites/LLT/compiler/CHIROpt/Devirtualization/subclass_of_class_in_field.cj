// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default2RRE&->@_CN7default1I1apgHv

interface I {
    prop a: Int64
}

open class RR <: I {
    public open prop a: Int64 {
        get() {
            return 1
        }
    }
}

open class RRR <: RR {
    public prop a: Int64 {
        get() {
            return 2
        }
    }
}

class R {
    public var a: RR = RRR()
}

main() {
    var b = R()
    return b.a.a - 2
}
