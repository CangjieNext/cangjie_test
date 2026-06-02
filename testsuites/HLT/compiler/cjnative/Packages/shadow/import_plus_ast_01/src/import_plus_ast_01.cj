/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o ./pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle
// EXEC: %compiler %cmp_opt %f   pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgb

main(): Int64 {
    let c0: Int64 = 3
    let c: Int64 = pkgb.Data_b<Int64>(c0)
    if (c != 3) {
        return 1
    }
    return 0
}
