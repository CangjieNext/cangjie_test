/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_different_or_pattern

main() {
    if (let a1 | _ | _ <- 1) {
    }
    if (let _ | a1 | _ <- 1) {
    }
    if (let _ | _ | a1 <- 1) {
    }
    while (let a1 | _ | _ <- 1) {
    }
    while (let _ | a1 | _ <- 1) {
    }
    while (let _ | _ | a1 <- 1) {
    }
    return 1
}
