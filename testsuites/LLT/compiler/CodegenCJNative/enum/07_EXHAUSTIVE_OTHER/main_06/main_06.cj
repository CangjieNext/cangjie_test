// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA pkgB pkgC
// EXEC: %compiler %cmp_opt pkgA/pkgA.cj %compile_lib_opt -o pkgA.%middle
// EXEC: %compiler %cmp_opt pkgB/pkgB.cj %compile_lib_opt -o pkgB.%middle
// EXEC: %compiler %cmp_opt pkgC/pkgC.cj %compile_lib_opt -o pkgC.%middle
// EXEC: %compiler %cmp_opt %f pkgC.%middle pkgB.%middle pkgA.%middle -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-3 CCCC888999

import pkgB.*
import pkgC.*

main() {
    moo()
    foo()
    goo()
    return 0
}
