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
// ASSERT:scan 671212096712122616777339485034522768720147948096872014794816156681078167826872015250566129.701004120.678200123.456001123475.690556123448.210993123456.456000

@OverflowWrapping
func test(a: Int32, b: Int32): Unit {
    var i: Int32
    var j: Int32
    var k: Int32
    var x: Int32
    var y: Int32

    j = a + 3
    k = b + 7
    i = j + k
    i = i + 0x0FFF
    i = i + 0x1000
    i = i + 0x1010
    x = i + 0x800000
    x = x + 0x800010
    x = x + 0x1800000
    y = x + 0x1800010

    print(y.toString())
}

func test(a: Int64, b: Int64): Unit {
    var i: Int64
    var j: Int64
    var k: Int64
    var x: Int64
    var y: Int64

    j = a + 3
    k = b + 7
    i = j + k
    i = i + 0x0FFF
    i = i + 0x1000
    i = i + 0x1010
    x = i + 0x800000
    x = x + 0x800010
    x = x + 0x032001800010
    y = x + 0x032001800000

    print(y.toString())
}

func test(a: Float32, b: Float32): Unit {
    let c: Float32 = a + b
    print((c + 123.456).toString())
}

func test(a: Float64, b: Float64): Unit {
    let c: Float64 = a + b
    print((c + 123456.456).toString())
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
    test(Float64(-8.0), Float64(-0.245007))
    test(Float64(0.0), Float64(0.0))

    return 0
}
