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
    if let 1 | 1 <- 1 {
    }
    if let _ | _ <- 1 {
    }
    if let a1 | a2 <- 1 {
    }
    if let (1, a) | (_, _) <- (1, 2) {
    }
    if let _: Int64 | a: Int64 <- 1 {
    }
    if let Some(1) | Some(a) <- Some(1) {
    }
    while let 1 | 1 <- 1 {
    }
    while let _ | _ <- 1 {
    }
    while let a1 | a2 <- 1 {
    }
    while let (1, a) | (_, _) <- (1, 2) {
    }
    while let _: Int64 | a: Int64 <- 1 {
    }
    while let Some(1) | Some(a) <- Some(1) {
    }
    return 0
}
