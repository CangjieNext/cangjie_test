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

func foo1(x!: Int8 = 1): Int8 {
    return x
}

func foo2(x!: Int64 = 2): Int64 {
    return x
}

func foo3(x!: Float32 = 3.0): Float32 {
    return x
}

func foo4(x!: Float64 = 4.0): Float64 {
    return x
}

main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    var res3: Float32 = foo3()
    var res4: Float64 = foo4()
    if (res1 != 1 || res2 != 2 || res3 != 3.0 || res4 != 4.0) {
        return 1
    }
    return 0
}
