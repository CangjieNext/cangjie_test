// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA pkgB
// EXEC: %compiler %cmp_opt pkgA/pkgA.cj %compile_lib_opt -o pkgA.%middle
// EXEC: %compiler %cmp_opt pkgB/pkgB.cj %compile_lib_opt -o pkgB.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt pkgB.%middle pkgA.%middle %f -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt pkgA.%middle pkgB.%middle %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

internal import pkgB.*

main() {
    println(test())
    0
}
