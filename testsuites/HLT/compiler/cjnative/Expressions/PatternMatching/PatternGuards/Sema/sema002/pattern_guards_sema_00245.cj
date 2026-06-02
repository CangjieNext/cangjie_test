/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ where (match (i)) {case _ => 1} => i
    }
    return y - 1
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_case
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_double_arrow_in_case
