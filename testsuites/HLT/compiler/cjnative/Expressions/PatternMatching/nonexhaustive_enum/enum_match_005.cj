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

enum EE<T, R> {
    | A1(T) | A2(R) | B1(T, R) | C1 | ...
}

main() {
    let tup = (EE<Int64, Int64>.A1(1), EE<Int64, Int64>.B1(1, 1), EE<Int64, Int64>.C1)
    let value = match (tup) {
        case (A1(2), A1(1), C1) => 1
        case (A1(1), B1(1, 0), C1) => 2
        case (x, y, z) => 0
    }
    value
}
