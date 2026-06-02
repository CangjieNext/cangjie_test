/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func Int8Div() {
    var a0: Int8 = -126
    var a1: Int8 = 126
    var b0: Int8 = -11
    var b1: Int8 = 11

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1
    
    var sum = a0 + a1 + b0 + b1 + c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7
    if (sum == 0) {
        return 0
    }
    return 1
}

func Int16Div() {
    var a0: Int16 = -32766
    var a1: Int16 = 32766
    var b0: Int16 = -181
    var b1: Int16 = 181

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    var sum = a0 + a1 + b0 + b1 + c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7
    if (sum == 0) {
        return 0
    }
    return 1
}

func Int32Div() {
    var a0: Int32 = -2147483640
    var a1: Int32 = 2147483640
    var b0: Int32 = -46340
    var b1: Int32 = 46340

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    var sum = a0 + a1 + b0 + b1 + c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7
    if (sum == 0) {
        return 0
    }
    return 1
}

func Int64Div() {
    var a0: Int64 = -9223372036854775800
    var a1: Int64 = 9223372036854775800
    var b0: Int64 = -3037000499
    var b1: Int64 = 3037000499

    var c0 = a0 / b0
    var c1 = a0 % b0
    var c2 = a0 / b1
    var c3 = a0 % b1
    var c4 = a1 / b0
    var c5 = a1 % b0
    var c6 = a1 / b1
    var c7 = a1 % b1

    var sum = a0 + a1 + b0 + b1 + c0 + c1 + c2 + c3 + c4 + c5 + c6 + c7
    if (sum == 0) {
        return 0
    }
    return 1
}

func UInt8Div() {
    var a0: UInt8 = 225
    var b0: UInt8 = 15

    var c0 = a0 / b0
    var c1 = a0 % b0

    var sum = a0 + b0 + c0 + c1
    if (sum == 255) {
        return 0
    }
    return 1
}

func UInt16Div() {
    var a0: UInt16 = 65535
    var b0: UInt16 = 256

    var c0 = a0 / b0
    var c1 = a0 % b0

    var sum = a0 + b0 + c0 + c1
    if (sum == 765) {
        return 0
    }
    return 1
}

func UInt32Div() {
    var a0: UInt32 = 429496729
    var b0: UInt32 = 20724

    var c0 = a0 / b0
    var c1 = a0 % b0

    var sum = a0 + b0 + c0 + c1
    if (sum == 429550730) {
        return 0
    }
    return 1
}

func UInt64Div() {
    var a0: UInt64 = 1844674407370955161
    var b0: UInt64 = 1358187913

    var c0 = a0 / b0
    var c1 = a0 % b0

    var sum = a0 + b0 + c0 + c1
    if (sum == 1844674410438990579) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int8Div() + Int16Div() + Int32Div() + Int64Div() + UInt8Div() + UInt16Div() + UInt32Div() + UInt64Div()
}
