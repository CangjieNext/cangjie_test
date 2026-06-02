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
// ASSERT:scan -67117087-67117089-1140858921-33565123-67117087-67117101-17592253161033-68023753-123452.695-123463.672-123456.453-123461.691-123464.211-123456.456

import std.convert.*

@OverflowWrapping
func test(a: Int32, b: Int32): Unit {
    var i: Int32 = 0
    var j: Int32 = 0
    var k: Int32 = 0
    var m: Int32 = a
    var n: Int32 = b
    if (a < 0) {
        m = -a
    }
    if (b < 0) {
        n = -b
    }
    j = m - n
    k = n - m
    i = j - k
    i = i - 0x0FFF
    i = i - 0x1000
    var x: Int32 = i - 0x800000
    x = x - 0x800010
    x = x - 0x1800000
    let y: Int32 = x - 0x1800010
    print(y.toString())
}

func test(a: Int64, b: Int64): Unit {
    var i: Int64 = 0
    var j: Int64 = 0
    var k: Int64 = 0
    var m: Int64 = a
    var n: Int64 = b
    if (a < 0) {
        m = -a
    }
    if (b < 0) {
        n = -b
    }
    j = m - n
    k = n - m
    i = j - k
    i = i - 0x0FFF
    i = i - 0x1000
    var x: Int64 = i - 0x800000
    x = x - 0x800010
    x = x - 0x1800000
    let y: Int64 = x - 0x1800010
    print(y.toString())
}

func test(a: Float32, b: Float32): Unit {
    let c: Float32 = a - b
    print((c - 123456.456).format(".3"))
}

func test(a: Float64, b: Float64): Unit {
    let c: Float64 = a - b
    print((c - 123456.456).format(".3"))
}

@OverflowWrapping
main(): Int64 {
    test(Int32(0), Int32(0))
    test(Int32(8), Int32(9))
    test(Int32(0x5fffffff), Int32(4))
    test(Int32(0xff000000), Int32(1234))

    test(Int64(0), Int64(0))
    test(Int64(0), Int64(7))
    test(Int64(-234), Int64(0x7ffffffffff))
    test(Int64(1212), Int64(454545))

    test(Float32(5.0), Float32(1.245))
    test(Float32(-5.0), Float32(2.2222))
    test(Float32(0.0), Float32(0.0))

    test(Float64(7.0), Float64(12.234556))
    test(Float64(-8.0), Float64(-0.2450007))
    test(Float64(0.0), Float64(0.0))

    return 0
}
