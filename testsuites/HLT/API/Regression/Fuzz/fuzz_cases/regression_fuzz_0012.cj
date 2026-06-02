/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt  %f -o %output



import p1* as aoo 

main({: Int6M {
    return 0
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_expected_right_delimiter
