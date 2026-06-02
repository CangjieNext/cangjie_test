/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-6 sema_var_in_or_condition

main() {
    if (let a1 <- 1 || true) {
    }
    if (true || let a2 <- 1) {
    }
    if (let a1 <- 1 && true || true) {
    }
    while (let a1 <- 1 || true) {
    }
    while (true || let a2 <- 1) {
    }
    while (let a1 <- 1 && true || true) {
    }
    return 0
}
