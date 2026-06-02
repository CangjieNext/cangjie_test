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
// EXEC: %compiler %cmp_opt pkga.%middle %f  -o %output

package pkg_issue_01

import pkga.*

// let a: Int32 = one

main(): Int64 {
    let a: Int32 = one
    if (a != 1) {
        return 1
    }
    return 0
}
