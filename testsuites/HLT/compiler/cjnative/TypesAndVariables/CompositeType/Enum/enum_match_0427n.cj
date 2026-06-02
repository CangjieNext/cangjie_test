/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output  2>&1 | compare %f


enum TimeUnit{
      Hour
      | Day(Int32,Int32)
}

func run(): Int64 {
    var time = TimeUnit.Day(2020,2022) @{       
    var res: Int64 = match (time) {
        case Hour => 2021
        case Day(x,y) => x+y
    }
    return res
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_character
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// (iOS) ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_expected_right_delimiter
