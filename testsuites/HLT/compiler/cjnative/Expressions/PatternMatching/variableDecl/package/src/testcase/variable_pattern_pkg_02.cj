/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../resa
// EXEC: %compiler %cmp_opt %compile_lib_opt resa/r02.cj -o resa.%middle
// EXEC: %compiler %cmp_opt %f resa.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package testcase

import resa.*

main(): Int64 {
    if (a != 1) {
        return 1
    }
    if (b != 2) {
        return 2
    }
    return 0
}
