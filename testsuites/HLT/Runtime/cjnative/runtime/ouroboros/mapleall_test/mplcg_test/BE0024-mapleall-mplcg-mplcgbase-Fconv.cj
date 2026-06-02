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
// ASSERT:scan 020-530020-530020-530020-5300.012562.0-345.045012344.00.012562.0-345.045012344.00.012562.0-345.045012344.0

import std.convert.*

func fconv_f2i(f: Float32): Int32 {
    return Int32(f)
}

func fconv_f2ll(f: Float32): Int64 {
    return Int64(f)
}

func fconv_d2i(d: Float64): Int32 {
    return Int32(d)
}

func fconv_d2ll(d: Float64): Int64 {
    return Int64(d)
}

func fconv_i2f(i: Int32): Float32 {
    return Float32(i)
}

func fconv_i2d(i: Int32): Float64 {
    return Float64(i)
}

func fconv_ll2f(ll: Int32): Float32 {
    return Float32(ll)
}

func fconv_ll2d(ll: Int64): Float64 {
    return Float64(ll)
}

main(): Int64 {
    print(fconv_f2i(0.0).toString())
    print(fconv_f2i(2.0).toString())
    print(fconv_f2i(0.1234).toString())
    print(fconv_f2i(-530.1234).toString())

    print(fconv_f2ll(0.0).toString())
    print(fconv_f2ll(2.0).toString())
    print(fconv_f2ll(0.1234).toString())
    print(fconv_f2ll(-530.1234).toString())

    print(fconv_d2i(0.0).toString())
    print(fconv_d2i(2.0).toString())
    print(fconv_d2i(0.1234).toString())
    print(fconv_d2i(-530.1234).toString())

    print(fconv_d2ll(0.0).toString())
    print(fconv_d2ll(2.0).toString())
    print(fconv_d2ll(0.1234).toString())
    print(fconv_d2ll(-530.1234).toString())

    print(fconv_i2f(0).format(".1"))
    print(fconv_i2f(12562).format(".1"))
    print(fconv_i2f(-345).format(".1"))
    print(fconv_i2f(45012344).format(".1"))

    print(fconv_ll2f(0).format(".1"))
    print(fconv_ll2f(12562).format(".1"))
    print(fconv_ll2f(-345).format(".1"))
    print(fconv_ll2f(45012344).format(".1"))

    print(fconv_i2d(0).format(".1"))
    print(fconv_i2d(12562).format(".1"))
    print(fconv_i2d(-345).format(".1"))
    print(fconv_i2d(45012344).format(".1"))

    return 0
}
