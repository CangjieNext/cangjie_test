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
// EXEC-PIPE-1: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.*

class Subson <: Son {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_cannot_inherit_sealed
