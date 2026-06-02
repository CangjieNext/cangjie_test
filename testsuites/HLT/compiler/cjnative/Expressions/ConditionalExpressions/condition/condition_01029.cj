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
    if let (1, a) <- (1, 1) && let (a, 1) <- (1, 1) || let (_, _) <- (1, 1) {
    }
    while let (_, _) <- (1, 1) || let (1, a) <- (1, 1) && let (a, 1) <- (1, 1) {
    }
    return 0
}
