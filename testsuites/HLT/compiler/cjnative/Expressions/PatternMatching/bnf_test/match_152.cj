/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f




main() {
    var i = true
    var x = "bom"
    match (i) { case true where ([] if (x == "bom")) => case false where) { if (x != "bom")) => } 
    return 0
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_case_body_cannot_be_empty
// ASSERT: scan parse_expected_expression
