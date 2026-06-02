/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgsa/pkgsa.cj src/pkgsa/pkgsb.cj -o pkgsa.%middle
// EXEC: %compiler %cmp_opt %f  pkgsa.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgsa

main(): Int64 {
    let a = pkgsa.one
    let b = pkgsa.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
