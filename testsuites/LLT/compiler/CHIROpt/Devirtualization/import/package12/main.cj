// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization pkg1.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization test0.%middle main.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import pkg1.*

class A <: I1 {
    public func foo1(): Int64 {
        0
    }
}

func foo2(i: I1) {
    i.foo1()
}

main() {
    foo2(A())
}
