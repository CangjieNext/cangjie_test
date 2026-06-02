// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization test0.%middle test1.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [20,9] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test0.*

main(): Int64 {
    let b: I<Int64, UInt64> = C<UInt8>()
    var a: I1<Rune> = A();
    if (a.foo() == r'x') {
        return 0
    }
    return 1;
}
