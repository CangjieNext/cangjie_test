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
// EXEC-PIPE-1: %compiler %cmp_opt %f  pkgs.%middle -o %n.%suffix 2>&1 | compare %f



import pkgs.foo as true 

main(): Int64 {
    var res = true()
    if (res != 3) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_name
