/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    enum i { AA
        | BB
        | CC
        | DD
    }
    let i = "AA"
    match (i) { case $.AA => } 
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_pattern
// ASSERT: scan parse_case_body_cannot_be_empty
