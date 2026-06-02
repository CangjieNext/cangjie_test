// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %enableCompileDebug %compile_lib_opt pkg.cj -o libpkg.a
// (CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %enableCompileDebug %f -L. -lpkg -o %output
// EXEC: %run %run_opt %output

internal import pkg.*

main() {
    // The default parameter function is imported by source when this file is compiled with "-O2".
    // Although it's not actually called (as we specified the "true" argument), its function body will still emerge due to "-g".
    // On Windows, weak symbols cannot be used to resolve undefined symbols, due to the weak external mechanism.
    // In this situation, the visibility of the imported function should be internal, in order not to conflict with its original definition which is external.
    foo(10, b: true)
    return 0
}
