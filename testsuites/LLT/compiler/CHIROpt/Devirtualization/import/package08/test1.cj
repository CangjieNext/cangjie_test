// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization test0.%middle test1.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to Foo at [33,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to Bar at [37,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test0.*

private interface I {
    func Foo(): Int64 {
        3
    }
}

private interface I2 {
    func Bar(): Int64 {
        4
    }
}

private class B <: A & I & I2 {}

private func Test(i: I) {
    i.Foo()
}

private func Test2(i2: I2) {
    i2.Bar()
}

main() {
    Test(B())
    Test2(B())
}
