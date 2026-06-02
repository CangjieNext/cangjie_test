/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_expected_right_delimiter

main() {
    if (let a <- 1 > 0) {
    }
    if (let a <- 1 is Int64) {
    }
    while (let a <- 1 < 0) {
    }
    while (let a <- 1 as Int64) {
    }
    return 0
}
