/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: moudle013
// EXEC: %compiler %cmp_opt %compile_lib_opt moudle013/src/pkgs/pkgs.cj -o pkgs.%middle 
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f  pkgs.%middle -o %n.%middle 2>&1 | compare %f




fron "moudle013" import pkgs

main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_decl
