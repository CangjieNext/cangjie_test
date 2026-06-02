// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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
