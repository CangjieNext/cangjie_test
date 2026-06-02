/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// *在元组中解析
main(): Int64 {
    let a = (*[1,3,4])  
    if (a[2] == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_expected_expression
