/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func foo(x: Int8): Int32 {
    return 2 // 2 is inferred to be Int32
}

func foo(x: Int64): Int64 {
    return 3 // 2 is inferred to be Int64
}

func foo(x: Float32): Float64 {
    return 3.0 // 3.0 is inferred to be Float64
}

func foo(x: Float64): Float32 {
    return 3.0 // 3.0 is inferred to be Float32
}

main(): Int64 {
    var num1: Int8 = 2
    var num2: Float32 = 2.0
    var num3: Float32 = 2.0
    var num4 = 2 // 2 is inferred to be Int64
    var num5 = 2.0 // 2.0 is inferred to be Float64

    var res1: Int32 = foo(num1)
    var res2: Int64 = foo(num4)
    var res3: Int64 = foo(3) // 3 is inferred to be Int64, return 3
    var res4: Int32 = foo(3) // 3 is inferred to be Int8, return 2
    var res4_1 = foo(3) // 3 is inferred to be Int64, return 3

    var res5: Float64 = foo(3.0)
    var res6: Float64 = foo(num2)
    var res7: Float64 = foo(num3)

    var res8: Float32 = foo(num5)
    var res9: Float32 = foo(3.0)

    if (res1 == 2 && res2 == 3 && res3 == 3 && res4 == 2 && res4_1 == 3 && res5 + res6 + res7 == 9.0 && res8 + res9 ==
        6.0) {
        return 0
    }
    return 1
}
