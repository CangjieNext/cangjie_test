/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func throwException(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64, h: Int64): Int64 {
    if (a + b + c + d + e + f + g + h > 100) {
        throw Exception()
    } else {
        throwException(a + 1, b + 1, c + 1, d + 1, e + 1, f + 1, g + 1, h + 1)
    }
    return 1
}

func test2(input: Float64): Float64 {
    var a0: Float64 = 0.1 * input
    var a1: Float64 = 1.0 * input
    var a2: Float64 = 2.0 * input
    var a3: Float64 = 3.0 * input
    var a4: Float64 = 4.0 * input
    var a5: Float64 = 5.0 * input
    var a6: Float64 = 6.0 * input
    var a7: Float64 = 7.0 * input
    var a8: Float64 = 8.0 * input
    var a9: Float64 = 9.0 * input
    var a10: Float64 = 10.0 * input
    try {
        a10 = a1 * 10.0
        throwException(10, 10, 100, 5, 10, 10, 10, 10)
    } catch (_) {
    }
    var a11: Float64 = a10 + input
    var a12: Float64 = a11 + input
    var a13: Float64 = a12 + input
    var a14: Float64 = a12 + a13
    var a15: Float64 = a12 + a0
    var a16: Float64 = a12 + a1
    var a17: Float64 = a12 + a2
    var a18: Float64 = a12 + a3
    var a19: Float64 = a12 + a4
    var a20: Float64 = a12 + a5
    var a21: Float64 = a12 + a6
    var a22: Float64 = a12 + a7
    var a23: Float64 = a12 + a8
    var a24: Float64 = a12 + a9
    var a25: Float64 = a12 + a10
    var a26: Float64 = a12 + a11
    var a27: Float64 = a12 + a12
    var a28: Float64 = a12 + a13
    var a29: Float64 = a12 + a14
    var a30: Float64 = a12 + a15
    var a31: Float64 = a12 + a16
    var s = a11 + a12 + a13 + a14 + a15 + a16 + a17 + a18 + a19 + a20 + a21 + a22 + a23 + a24 + a25 + a26 + a27 + a28 +
        a29 + a30 + a31
    if (s.toString() == "406.200000") {
        return 0.0
    }
    return 1.0
}

func test1(input: Float64) {
    var a0: Float64 = 0.1 + input
    var a1: Float64 = 1.0 + input
    var a2: Float64 = 2.0 + input
    var a3: Float64 = 3.0 + input
    var a4: Float64 = 4.0 + input
    var a5: Float64 = 5.0 + input
    var a6: Float64 = 6.0 + input
    var a7: Float64 = 7.0 + input
    var a8: Float64 = 8.0 + input
    var a9: Float64 = 9.0 + input
    var a10: Float64 = 10.0 + input
    var a11: Float64 = a10 + input
    var a12: Float64 = a11 + input
    var a13: Float64 = a12 + input
    var a14: Float64 = a12 + a13
    var a15: Float64 = a12 + a0
    var a16: Float64 = a12 + a1
    var a17: Float64 = a12 + a2
    var a18: Float64 = a12 + a3
    var a19: Float64 = a12 + a4
    var a20: Float64 = a12 + a5
    var a21: Float64 = a12 + a6
    var a22: Float64 = a12 + a7
    var a23: Float64 = a12 + a8
    var a24: Float64 = a12 + a9
    var a25: Float64 = a12 + a10
    var a26: Float64 = a12 + a11
    var a27: Float64 = a12 + a12
    var a28: Float64 = a12 + a13
    var a29: Float64 = a12 + a14
    var a30: Float64 = a12 + a15
    var a31: Float64 = a12 + a16
    try {
        a10 = test2(a1)
        throwException(10, 10, 100, 5, 10, 10, 10, 10)
    } catch (_) {
    }
    var s = a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14 + a15 + a16 + a17 + a18 + a19 +
        a20 + a21 + a22 + a23 + a24 + a25 + a26 + a27 + a28 + a29 + a30 + a31
    if (s.toString() == "391.300000") {
        return 0.0
    }
    return 1.0
}

main(): Int64 {
    if (test1(0.0).toString() == "0.000000") {
        return 0
    }
    return 1
}
