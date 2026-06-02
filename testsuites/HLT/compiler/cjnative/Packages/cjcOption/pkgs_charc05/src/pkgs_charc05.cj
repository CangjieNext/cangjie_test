/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs01.cj src/pkgs/pkgs02.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs

main(): Int64 {
    let a: Int32 = pkgs.two
    let b: Int32 = pkgs.three
    if (a == 3 && b == 4) {
        return 0
    }
    return 1
}
