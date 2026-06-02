/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %pkg_opt %compile_lib_opt src/pkga/pkgb/pkgc/pkgd/pkge/ -o ./
// EXEC: %compiler %cmp_opt %f libpkga.pkgb.pkgc.pkgd.pkge.%middle -o %output

// RUN-EXEC: %run %run_opt %output %run_args

import pkga.pkgb.pkgc.pkgd.pkge
import pkga.pkgb.pkgc.pkgd.pkge.five

main(): Int64 {
    let e = five
    let e2 = pkge.five
    if (e != 5) {
        return 1
    }
    if (e2 != 5) {
        return 1
    }
    return 0
}
