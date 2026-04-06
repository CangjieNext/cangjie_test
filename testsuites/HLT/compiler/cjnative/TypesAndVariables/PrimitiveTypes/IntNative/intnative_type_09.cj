/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}

main(): IntNative {
    let b: IntNative = 2
    let time2 = TimeUnit2<IntNative>.Month(b)
    let howManyHours2: IntNative = match (time2) {
        case Year(x) => 1 * 1
        case Month(y) => y * 30 * 24
        case Day => 24
    }
    return 0
}
