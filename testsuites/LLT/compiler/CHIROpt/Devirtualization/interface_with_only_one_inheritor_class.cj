// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to f1 at [41,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to f1 at [45,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private interface I1 {
    func f1(a: Int64): Int64 {
        1
    }
}

private interface I2 <: I1 {
    func f1(a: Int64): Int64 {
        2
    }
}

private interface I3 <: I2 {
    func f1(a: Int64): Int64 {
        3
    }
}

private open class A {}

private open class A1 <: A & I2 & I3 {
    public func f1(a: Int64): Int64 {
        0
    }
}

private func Test(i2: I2) {
    i2.f1(1)
}

private func Test1(i3: I3) {
    i3.f1(1)
}

main() {
    Test(A1())
    Test1(A1())
}
