// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA.cj
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization pkgA.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization test0.%middle pkgB.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import A.*

main() {
    var foo: I = Foo.create("foo")
    foo.getName()
    0
}
