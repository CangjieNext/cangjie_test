/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: enum_package.cj
// EXEC: %compiler %cmp_opt enum_package.cj %compile_lib_opt -o liba.b.%middle
// EXEC: %compiler %cmp_opt %f liba.b.a -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package b

import a.b.*

main() {
    match (E1<Int64>.A1) {
        case A2(1) => 1
        case A1 => 0
        case x => 2
    }
}
