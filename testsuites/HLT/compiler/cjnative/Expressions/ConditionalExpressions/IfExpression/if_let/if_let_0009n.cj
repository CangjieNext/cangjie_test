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
    var a = if (let a <- 1 { 1 }
    return 0
}
// ASSERT: scan parse_trailing_closure_only_follow_name
// ASSERT: scan parse_expected_right_delimiter
