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
// ASSERT:scan 82.1833.64282018.4782.1833.64282018.460.000.00

import std.convert.*

func test1(f1: Float32, f2: Float32, f3: Float64, f4: Float32, f5: Float64): Float32 {
    let f2_2: Float32 = f1 + f2
    return Float32(f2_2 - Float32(f3) + Float32(f5) - f4)
}

func test2(f1: Float32, f2: Float32, f3: Float64, f4: Float32, f5: Float64): Float64 {
    let f2_2: Float32 = f1 + f2 - f4
    return Float64(Float64(f2_2) - f3 + f5)
}

func test3(): Float32 {
    return 0.0
}

func test4(): Float64 {
    return 0.0
}

main(): Int64 {
    print(test1(1.1, 1.2, 0.007, 43.234, 123.123123123).format(".2"))
    print(test1(333.3, 444.4, 555.5, 667.7777888, 479.222).format(".2"))
    print(test1(9849.1023, 0.00008, 23.2323, 534.534, 272727.123456).format(".2"))
    print(test2(1.1, 1.2, 0.007, 43.234, 123.123123123).format(".2"))
    print(test2(333.3, 444.4, 555.5, 667.7777888, 479.222).format(".2"))
    print(test2(9849.1023, 0.00008, 23.2323, 534.534, 272727.123456).format(".2"))
    print(test3().format(".2"))
    print(test4().format(".2"))
    return 0
}
