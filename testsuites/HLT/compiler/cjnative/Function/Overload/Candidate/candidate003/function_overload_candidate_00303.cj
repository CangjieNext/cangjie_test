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

func test(a!: UInt8 = 1, b!: UInt16 = 1, c!: UInt32 = 1, d!: UInt64 = 1): Int64 {
    return 1
}

func test(a: Int8, b!: UInt16 = 1, c!: UInt32 = 1, d!: Int8 = 1): Int64 {
    return 2
}

func test(a: Int16, b: UInt16, c!: UInt32 = 1, d!: UInt64 = 1): Int64 {
    return 3
}

func test(a: Int32, b: UInt16, c: UInt32, d!: UInt64 = 1): Int64 {
    return 4
}

func test(a: Int64, b: UInt16, c: UInt32, d: UInt64): Int64 {
    return 5
}

main(): Int64 {
    if (test() != 1) {
        return 1
    }
    if (test(Int8(1)) != 2) {
        return 2
    }
    if (test(Int16(1), UInt16(1)) != 3) {
        return 3
    }
    if (test(Int32(1), UInt16(1), UInt32(1)) != 4) {
        return 4
    }
    if (test(Int64(1), UInt16(1), UInt32(1), UInt64(1)) != 5) {
        return 5
    }
    return 0
}
