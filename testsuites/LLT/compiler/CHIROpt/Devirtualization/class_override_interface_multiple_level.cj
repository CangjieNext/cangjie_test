// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to f1 at [38,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private interface I1 {
    func f1(a: Int64): Int64 {
        1
    }
}

private interface I2 <: I1 {
    override func f1(a: Int64): Int64 {
        2
    }
}

private open class A {
    public open func f1(a: Int64): Int64 {
        3
    }
}

private class B <: A & I2 {
    public override func f1(a: Int64): Int64 {
        0
    }
}

private func Test(i1: I1) {
    i1.f1(1)
}

main() {
    Test(B())
}
