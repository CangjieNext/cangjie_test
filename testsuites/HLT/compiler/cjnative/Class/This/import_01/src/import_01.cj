/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/b.cj pkga.%middle -o pkgb.%middle
// EXEC: %compiler %cmp_opt src/%f pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

main(): Int64 {
    if (Coo().foo() is Coo && bb == 1 && Boo().foo() is Boo && aa == 1) {
        return 0
    }
    return 2
}
