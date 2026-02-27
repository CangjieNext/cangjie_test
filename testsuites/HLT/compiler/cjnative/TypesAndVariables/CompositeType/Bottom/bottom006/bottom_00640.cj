/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func test() : Int64 {true ? 0:return 1}


main(): Int64 {
    return test() // 0
}
// ASSERT: scan parse_expected_character_after
// ASSERT: scan parse_expected_operator_or_end
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// (iOS) ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_expected_right_delimiter
