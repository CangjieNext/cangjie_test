/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/*.cj  pkga.%middle -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import {pkgb.b1 as alias1, pkgb.b2 as alias2}

main(): Int64 {
    if (alias1 != 1 || alias2 != 1) {
        return 1
    }
    return 0
}
