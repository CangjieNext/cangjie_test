/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.*

main(): Int64 {
    let a: Data = Data(10)
    let b = Data(10, i1: 10)
    if (a.i == 10 && b.i == 10 && b.i1 == 10) {
        return 0
    }
    return 2
}
