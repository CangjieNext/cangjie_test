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

main(): Int64 {
    let a = [[[0]]]
    let c1: ?Array<Array<Array<Int64>>> = a
    let r1: ?Array<Array<Int64>> = c1?[0]
    let r2: ?Array<Int64> = r1?[0]
    let r3: ?Int64 = r2?[0]
    return r3 ?? 1
}
