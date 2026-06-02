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
// EXEC-PIPE-1: %compiler %cmp_opt %f  pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.*

type A<T> = classA<T>

main(): Int64 {
    var x: A<Int64> = A<Int64>(1)
    if (x.a == 1) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
