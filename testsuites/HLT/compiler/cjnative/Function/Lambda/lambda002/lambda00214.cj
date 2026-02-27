/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f


func test(): Int64 {
    let sum = {a: Int64, b: Int64 =>
    a + 1
    b + 1
    a + b
    return 0
}

main(): Int64 {
    return test()
}
// (iOS) ASSERT: scan parse_illegal_modifier_in_scope
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
