/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const lambda1 = {a: Int64, b: Int64 => a + b}
const lambda2 = {=> 1 + 2 ** 3}
const lambda3 = {a => a + 1}
const lambda4: (Int64, Int64) -> Int64 = {a, b => a + b}

main() {
    const _lambda1 = {a: Int64, b: Int64 => a + b}
    const _lambda2 = {=> 1 + 2 ** 3}
    const _lambda3 = {a => a + 1}
    const _lambda4: (Int64, Int64) -> Int64 = {a, b => a + b}

    if (lambda1(1, 2) == 3 && lambda2() == 9 && lambda3(-2) == -1
        && lambda4(-1, -2) == -3 && _lambda1(100, 2) == 102 && _lambda2() == 9
        && _lambda3(-1) == 0 && _lambda4(-1, -2) == -3) {
        return 0
    }
    return 1
}
