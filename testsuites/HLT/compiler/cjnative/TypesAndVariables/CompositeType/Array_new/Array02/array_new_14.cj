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
    let a: Array<Int8> = [1]
    let a1: Array<Int16> = [1]
    let a2: Array<Int32> = [1]
    let a3: Array<Int64> = [1]
    let a4: Array<UInt8> = [1]
    let a5: Array<UInt16> = [1]
    let a6: Array<UInt32> = [1]
    let a7: Array<UInt64> = [1]

    let a8: Array<Float16> = [1.0]
    let a9: Array<Float32> = [1.0]
    let a10: Array<Float64> = [1.0]
    let a11 = [r'a']
    let a12: Array<Bool> = [true]
    let a13 = [""]

    return a.size + a1.size + a2.size + a3.size + a4.size + a5.size + a6.size + a7.size + a8.size + a9.size + a10.size + a11
        .size + a12.size + a13.size - 14
}
