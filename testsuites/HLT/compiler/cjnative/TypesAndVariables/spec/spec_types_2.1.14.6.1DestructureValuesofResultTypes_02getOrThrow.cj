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

enum Result<T> {
    Ok(T) | Err(Exception)
}

main() {
    let rInt32_1 = Result<Int32>.Ok(100) // The type of 'rInt32_1' is 'Result<Int32>'
    let rInt32_2 = Result<Int32>.Err(Exception()) // The type of 'rInt32_2' is 'Result<Int32>'

    /*  .getOrThrow() and ?? , Unrealized
    let number1: Int32 = rInt32_1.getOrThrow()  // number1 = 100
    let number2: Int32 = rInt32_2.getOrThrow()  // throw
    let number3: Int32 = rInt32_1 ?? 0  // number1 = 100
    let number4: Int32 = rInt32_2 ?? 0  // number2 = 0
     */
    return 0
}
