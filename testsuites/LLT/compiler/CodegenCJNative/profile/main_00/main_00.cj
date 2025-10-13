// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgA/pkgA.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %optimization_level_2 --profile-compile-time --profile-compile-memory --fno-chir-function-inlining pkg.%middle %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan printlnT::x=100

import pkgA.*

main() {
    printlnT(100)
}
