// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [29,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I {
    func foo(): Int64 {
        1
    }
}

open class A <: I {
    public override func foo(): Int64 {
        return 1
    }
}

let global_a = A();

func f(): I {
    var aa: I = global_a
    aa.foo()
    return global_a
}

main() {
    f()
    return 0
}
