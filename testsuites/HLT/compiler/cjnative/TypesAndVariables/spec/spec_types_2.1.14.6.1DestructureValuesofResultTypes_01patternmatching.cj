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
    let number1: Int32 = match (rInt32_1) {
        case Ok(num) => num // matched
        case Err(_) => 0
    }
    let number2: Int32 = match (rInt32_2) {
        case Ok(num) => num // matched
        case Err(_) => 0
    }
    return 0
}
