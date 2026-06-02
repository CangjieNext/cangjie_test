// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA pkgB pkgC
// EXEC: %compiler %cmp_opt %compile_lib_opt  pkgA/pkgA.cj -o pkgA.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt  pkgB/pkgB.cj -o pkgB.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt  pkgC/pkgC.cj -o pkgC.%middle
// (not CJNATIVE) EXEC: %compiler %cmp_opt pkgA.%middle pkgB.%middle pkgC.%middle %f -o %output
// (CJNATIVE) EXEC: %compiler %cmp_opt pkgC.%middle pkgB.%middle pkgA.%middle %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

internal import pkgA.*
internal import pkgB.*
internal import pkgC.*

main() {
    println(test(hh))
    0
}
