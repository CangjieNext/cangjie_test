/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main(): Int64 {
    var r : Int32 = 1
    var a : Int32 = 2
    var b : Int32 = 3
    (true?a:b) = r 
    return 0
}
// ASSERT: scan parse_expected_character_after
// ASSERT: scan parse_expected_operator_or_end
// ASSERT: scan parse_expected_right_delimiter
