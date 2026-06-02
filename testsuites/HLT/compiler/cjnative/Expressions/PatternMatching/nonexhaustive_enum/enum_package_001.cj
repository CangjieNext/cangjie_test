/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: enum_package.cj
// EXEC: %compiler %cmp_opt enum_package.cj %compile_lib_opt
// EXEC: %compiler %cmp_opt %f liba.b.a -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package a.b.c

import a.b.*

main() {
    E1<Int64>.A1
    E2<Int64>.B2(1)
    match (E3<Int64>.C3(1)) {
        case C1 | C2(1) | C3(0) => 1
        case _ => 0
    }
}
