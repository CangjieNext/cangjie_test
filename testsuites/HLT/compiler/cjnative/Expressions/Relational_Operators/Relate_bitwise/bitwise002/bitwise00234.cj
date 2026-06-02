/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f

main(): Int64 {
    var a:Int8 = 8
    a = 12 << if
    a = 12 >> else
    return 0
}
// ASSERT: scan parse_expected_left_paren_after
// ASSERT: scan parse_expected_right_delimiter
