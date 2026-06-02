/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../pkga ../pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/pkgb.cj  -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle  -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

package pkg

import pkga.*
import pkgb.*

main(): Int64 {
    return A<Int64>().plus(A<Int64>(), A<Int64>()) - 2
}
