// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC:%compiler %cmp_opt %enableO2 %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %enableCompileDebug %f pkg.%middle -o %output
// EXEC: %run %run_opt %output

internal import pkg.*

main() {
    foo(10) // the linkage of default parameter function is weak_odr when pkg compiler with O2 and import inline, but windows don't use weak odr
    return 0
}
