/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_expected_left_paren_after
// ASSERT: scan parse_expected_left_paren

main() {
    if let a1 <- 1 && let a2 <- 1 || let a3 <- 1 {
    }
    while let a1 <- 1 || let a2 <- 1 && let a3 <- 1 {
    }
    return 0
}
