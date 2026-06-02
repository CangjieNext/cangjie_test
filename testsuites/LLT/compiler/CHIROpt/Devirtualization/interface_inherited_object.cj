// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [27,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A {
    func foo(): Int64 {
        return 2
    }
}

abstract class A1 <: A {}

open class A11 <: A1 {}

open class A12 <: A1 {}

main() {
    var a: A = A11() // invoke
    a.foo() - 2
}
