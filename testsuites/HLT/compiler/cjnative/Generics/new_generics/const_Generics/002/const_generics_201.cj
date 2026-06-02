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

enum Position<T, R> {
    Left(T)
    | Right(R)
    | Middle
}

main(): Int64 {
    const l1 = Position<Int64, UInt64>.Left(-10)
    const l2 = Position<Int64, UInt64>.Right(100)
    const l3 = Position<Int64, UInt64>.Middle
    return 0
}
