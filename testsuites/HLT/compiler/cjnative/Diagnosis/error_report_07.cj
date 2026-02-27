/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func bar() {2

main():Int64 {
    bar()
    return 0
}
// (iOS) ASSERT: scan parse_illegal_modifier_in_scope
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
