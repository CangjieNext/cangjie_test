/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 001-1-10000100-100001-100-11001-100

import std.math.*

func test(i: Int32, j: Int32): Unit {
    if (i == j) {
        print((0).toString())
    } else if (i < j) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func test(i: Int32): Unit {
    var res: Int32 = 0
    if (i == 0x0FFF) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1010) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x800000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x800010) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1800000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1800010) {
        res += 1
    } else {
        res += 0
    }
    print(res.toString())
}

func test(i: Int64, j: Int64): Unit {
    if (i == j) {
        print((0).toString())
    } else if (i < j) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func test(i: Int64): Unit {
    var res: Int64 = 0
    if (i == 0x0FFF) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1010) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x800000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x800010) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1800000) {
        res += 1
    } else {
        res += 0
    }
    if (i == 0x1800010) {
        res += 1
    } else {
        res += 0
    }
    print(res.toString())
}

func test(i: Float32, j: Float32): Unit {
    let diff: Float32 = i - j
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func test(i: Float64, j: Float64): Unit {
    let diff: Float64 = i - j
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func testNaN1(f1: Float32, f2: Float32): Unit {
    if (f1 == Float32.NaN || f2 == Float32.NaN) {
        print((-1).toString())
    }
    let diff: Float32 = f1 - f2
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func testNaN1(f1: Float64, f2: Float64): Unit {
    if (f1 == Float64.NaN || f2 == Float64.NaN) {
        print((-1).toString())
    }
    let diff: Float64 = f1 - f2
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func testNaN2(f1: Float32, f2: Float32): Unit {
    if (f1 == Float32.NaN || f2 == Float32.NaN) {
        print((1).toString())
    }
    let diff: Float32 = f1 - f2
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

func testNaN2(f1: Float64, f2: Float64): Unit {
    if (f1 == Float64.NaN || f2 == Float64.NaN) {
        print((1).toString())
    }
    let diff: Float64 = f1 - f2
    if (diff == 0.0) {
        print((0).toString())
    } else if (diff < 0.0) {
        print((-1).toString())
    } else {
        print((1).toString())
    }
}

@OverflowWrapping
main(): Int64 {
    test(Int32(0), Int32(0))
    test(Int32(7), Int32(7))
    test(Int32(9), Int32(7))
    test(Int32(9), Int32(101))
    test(Int32(0x80000000u32), Int32(101))

    test(Int32(0))
    test(Int32(9))
    test(Int32(-0x80000000))

    test(Int64(0), Int64(0))
    test(Int64(2), Int64(-7))
    test(Int64(-234), Int64(-234))
    test(Int64(1212), Int64(1212))
    test(Int64(0x8000000000000000u64), Int64(101))

    test(Int64(0))
    test(Int64(-234234))
    test(Int64(1212))
    test(Int64(0x8000000000000000u64))

    test(Float32(5.0), Float32(1.245))
    test(Float32(-5.0), Float32(2.2222))
    test(Float32(0.0), Float32(0.0))
    test(Float32(2.1), Float32(2.1))

    test(Float64(7.0), Float64(12.234556))
    test(Float64(8.0), Float64(-0.2450007))
    test(Float64(0.0), Float64(0.0))
    test(Float64(3.3), Float64(3.3))

    testNaN1(Float32(5.0), Float32(1.245))
    testNaN1(Float32(-5.0), Float32(2.2222))
    testNaN1(Float32(0.0), Float32(0.0))
    testNaN1(Float32(2.1), Float32(2.1))

    return 0
}
