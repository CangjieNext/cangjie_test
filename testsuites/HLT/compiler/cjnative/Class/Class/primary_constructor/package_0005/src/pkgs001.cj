/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f   pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.*

main(): Int64 {
    let a: Data = Data(i1: 10)
    let b = Data(11, I: 12)
    let c = Data(i1: 12, 9)

    if (a.i == 10 && b.i == 11 && b.i1 == 12) {
        return 0
    }
    return 2
}
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_unknown_named_argument
// ASSERT: scan sema_unordered_arguments
// ASSERT: scan sema_invalid_access_control
