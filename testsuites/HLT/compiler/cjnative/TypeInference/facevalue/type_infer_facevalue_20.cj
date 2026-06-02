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

let i: Int8 = 10

func foo1(): Int8 {
    1 + 1 + i
}

func foo2(): Int64 {
    5 / 2 + 10
}

func foo3(): Float32 {
    var i: Float32 = 10.0
    Float32(3 % 2) + i
}

func foo4(): Float64 {
    3.0 / 2.0 + 10.0
}

main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    var res3: Float32 = foo3()
    var res4: Float64 = foo4()

    if (res1 != 12 || res2 != 12 || res3 != 11.0 || res4 != 11.5) {
        return 1
    }
    return 0
}
