/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main():Int64{
    var rge = .. 
    var rge2 = .. 
    var rg2 = ..10 
    for (i in rge) {
        print(i.toString())
    }
    return 0
}
// ASSERT: scan parse_expected_expression
