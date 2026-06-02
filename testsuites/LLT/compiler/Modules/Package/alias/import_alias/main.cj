// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg -o pkg.%middle
// EXEC: %compiler %cmp_opt  %n.cj pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a = 2, b = 1

internal import pkg.a as b
internal import pkg.b as a

main() {
    println("a = ${a}, b = ${b}")
}
