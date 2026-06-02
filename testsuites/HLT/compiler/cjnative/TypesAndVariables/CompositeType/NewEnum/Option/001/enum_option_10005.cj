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
    var a : ?
    Int64 = 100
    match (a) {
        case _ : Option<Int64> => 0
        case _ => 1
    }
}
// ASSERT: scan parse_newline_not_allowed_between_quest_and_type
