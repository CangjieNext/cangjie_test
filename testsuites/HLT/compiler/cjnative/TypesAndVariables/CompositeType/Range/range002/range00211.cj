/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



main(): Int64 {
    var a = {0,1,2,3,4,5,6,7,8,9}
    let b = ..
    var res = 0
    for (i in a[b]) {
        res = res + i
    }
    if (res == 45) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_expected_expression
