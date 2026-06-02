// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to i1 at [26,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private interface I1 {
    func i1(a: Int64): Int64 {
        1
    }
}

private open class B <: I1 {
    public override func i1(a: Int64): Int64 {
        0
    }
}

private func Test(a: I1) {
    a.i1(1)
}

main() {
    Test(B())
}
