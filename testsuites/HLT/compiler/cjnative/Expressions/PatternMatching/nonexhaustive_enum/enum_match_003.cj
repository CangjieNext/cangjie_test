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

enum EE<T, R> {
    | A1(T) | A2(R) | B1(T, R) | C1 | ...
}

main() {
    let value = match (EE<Int64, Int64>.C1) {
        case A1(0) | A2(1) | B1(1, 2) => 1
        case _ => 0
    }
    value
}
