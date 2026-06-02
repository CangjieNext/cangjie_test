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
// ASSERT:scan 47584642445014464741145041145038393434483814383934344838144114504114501441415014414150

import std.convert.*

func test(i: Int32): Int32 {
    var r: Int32 = 0
    if (i == 4) {
        r += 1
    }
    if (i != 3) {
        r += 2
    }
    if (i < 7) {
        r += 4
    }
    if (i <= 8) {
        r += 8
    }
    if (i > 7) {
        r += 16
    }
    if (i >= 2) {
        r += 32
    }
    return r
}

func test(i: Int64): Int64 {
    var r: Int64 = 0
    if (i == 4) {
        r += 1
    }
    if (i != 3) {
        r += 2
    }
    if (i < 7) {
        r += 4
    }
    if (i <= 8) {
        r += 8
    }
    if (i > 7) {
        r += 16
    }
    if (i >= 2) {
        r += 32
    }
    return r
}

func test(i: Int32, j: Int32): Int32 {
    var r: Int32 = 0
    if (i == j) {
        r += 1
    }
    if (i != j) {
        r += 2
    }
    if (i < j) {
        r += 4
    }
    if (i <= j) {
        r += 8
    }
    if (i > j) {
        r += 16
    }
    if (i >= j) {
        r += 32
    }
    return r
}

func test(i: Int64, j: Int64): Int64 {
    var r: Int64 = 0
    if (i == j) {
        r += 1
    }
    if (i != j) {
        r += 2
    }
    if (i < j) {
        r += 4
    }
    if (i <= j) {
        r += 8
    }
    if (i > j) {
        r += 16
    }
    if (i >= j) {
        r += 32
    }
    return r
}

func test(f: Float32): Int32 {
    var r: Int32 = 0
    if (f == 4.3) {
        r += 1
    }
    if (f != 33.3) {
        r += 2
    }
    if (f < 7.2) {
        r += 4
    }
    if (f <= -18.7) {
        r += 8
    }
    if (f > 7.5) {
        r += 16
    }
    if (f >= -3.2) {
        r += 32
    }
    return r
}

func test(d: Float64): Int64 {
    var r: Int64 = 0
    if (d == 4.3) {
        r += 1
    }
    if (d != 33.3) {
        r += 2
    }
    if (d < 7.2) {
        r += 4
    }
    if (d <= -18.7) {
        r += 8
    }
    if (d > 7.5) {
        r += 16
    }
    if (d >= -3.2) {
        r += 32
    }
    return r
}

func test2(f: Float32): Int32 {
    var r: Int32 = 0
    if (f == 0.0) {
        r += 1
    }
    if (f != 0.0) {
        r += 2
    }
    if (f < 0.0) {
        r += 4
    }
    if (f <= 0.0) {
        r += 8
    }
    if (f > 0.0) {
        r += 16
    }
    if (f >= 0.0) {
        r += 32
    }
    return r
}

func test2(d: Float64): Int64 {
    var r: Int64 = 0
    if (d == 0.0) {
        r += 1
    }
    if (d != 0.0) {
        r += 2
    }
    if (d < 0.0) {
        r += 4
    }
    if (d <= 0.0) {
        r += 8
    }
    if (d > 0.0) {
        r += 16
    }
    if (d >= 0.0) {
        r += 32
    }
    return r
}

func test(f: Float32, g: Float32): Int32 {
    var r: Int32 = 0
    if (f == g) {
        r += 1
    }
    if (f != g) {
        r += 2
    }
    if (f < g) {
        r += 4
    }
    if (f <= g) {
        r += 8
    }
    if (f > g) {
        r += 16
    }
    if (f >= g) {
        r += 32
    }
    return r
}

func test(d: Float64, e: Float64): Int64 {
    var r: Int64 = 0
    if (d == e) {
        r += 1
    }
    if (d != e) {
        r += 2
    }
    if (d < e) {
        r += 4
    }
    if (d <= e) {
        r += 8
    }
    if (d > e) {
        r += 16
    }
    if (d >= e) {
        r += 32
    }
    return r
}

main(): Int64 {
    print(test(Int32(4)).toString())
    print(test(Int32(8)).toString())
    print(test(Int32(2)).toString())
    print(test(Int32(7)).toString())

    print(test(Int64(3)).toString())
    print(test(Int64(9)).toString())
    print(test(Int64(1)).toString())
    print(test(Int64(5)).toString())
    print(test(Int64(4)).toString())

    print(test(Int32(-234), Int32(-234)).toString())
    print(test(Int32(34), Int32(134)).toString())
    print(test(Int32(1034), Int32(134)).toString())

    print(test(Int64(2234), Int64(2234)).toString())
    print(test(Int64(34), Int64(134)).toString())
    print(test(Int64(51034), Int64(25134)).toString())

    print(test(Float32(4.1)).format(".0"))
    print(test(Float32(4.3)).format(".0"))
    print(test(Float32(7.2)).format(".0"))
    print(test(Float32(7.5)).format(".0"))
    print(test(Float32(33.3)).format(".0"))
    print(test(Float32(-3.2)).format(".0"))
    print(test(Float32(-18.7)).format(".0"))

    print(test(Float64(4.1)).format(".0"))
    print(test(Float64(4.3)).format(".0"))
    print(test(Float64(7.2)).format(".0"))
    print(test(Float64(7.5)).format(".0"))
    print(test(Float64(33.3)).format(".0"))
    print(test(Float64(-3.2)).format(".0"))
    print(test(Float64(-18.7)).format(".0"))

    print(test2(Float32(0.0)).format(".0"))
    print(test2(Float32(-3.2)).format(".0"))
    print(test2(Float32(5.4)).format(".0"))

    print(test2(Float64(0.0)).format(".0"))
    print(test2(Float64(-3.2)).format(".0"))
    print(test2(Float64(5.4)).format(".0"))

    print(test(Float32(-5.0), Float32(2.2222)).format(".0"))
    print(test(Float32(0.0), Float32(0.0)).format(".0"))
    print(test(Float32(2.1), Float32(2.1)).format(".0"))
    print(test(Float32(5.0), Float32(1.245)).format(".0"))

    print(test(Float64(-5.0), Float64(2.2222)).format(".0"))
    print(test(Float64(0.0), Float64(0.0)).format(".0"))
    print(test(Float64(2.1), Float64(2.1)).format(".0"))
    print(test(Float64(5.0), Float64(1.245)).format(".0"))

    return 0
}
