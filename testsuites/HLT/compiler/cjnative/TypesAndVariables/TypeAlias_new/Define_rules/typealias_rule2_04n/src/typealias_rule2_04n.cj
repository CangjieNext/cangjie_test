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
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkga.cj -o pkga.%middle 2>&1 | compare %f

import pkga.*

type classB = B

main(): Int64 {
    return 0
}
// ASSERT: scan sema_undeclared_type_name
