// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj %disableReflection -o pkg.%middle
// EXEC: %compiler %cmp_opt pkg.%middle %f %disableReflection -o %output
// EXEC-18: %run %run_opt %output %run_args

internal import pkg.*

main() {
    koo(SA(1)) + SA(2).dump() + SA(0).c
    // i.e., 4 + 5 + 9 = 18
}
