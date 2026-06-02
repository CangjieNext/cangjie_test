// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: package_001
// EXEC: %compiler %cmp_opt %enableCompileDebug %compile_lib_opt package_001/pkg.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %enableCompileDebug %f p1.%middle -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f

internal import package_001.*

main(): Int64 {
    unsafe {
        callableInC()
        f1()
    }
    foo()
    0
}
/* SCAN
callableInC(): CFunc
f1(): CFunc lambda
foo(): Function
*/
