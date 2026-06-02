/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var a = 0
    if (let a1 <- 1 && a1 == 1) {
        a += a1
    }
    if (true && let a1 <- 1) {
        a += a1
    }
    while (let a1 <- 1 && a1 == 1) {
        a += a1
        break
    }
    while (true && let a1 <- 1) {
        a += a1
        break
    }
    return a - 4
}
