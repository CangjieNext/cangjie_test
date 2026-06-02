/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: module034001
// EXEC: %compiler %cmp_opt %compile_lib_opt module034001/src/pkgs034001a/pkgs034001a.cj -o pkgs034001a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %n.%middle 2>&1 | compare %f

import module034001.pkgs034001a.* as alias034001

main(): Int64 {
    let b = alias034001.two
    if (b != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_character
