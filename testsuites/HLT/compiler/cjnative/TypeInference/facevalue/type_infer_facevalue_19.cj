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

var i = 3

func foo1(): Int8 {
    return 2 + 2
}

func foo2(): Int64 {
    return 2 + i
}

func foo3(): Float32 {
    var i: Float32 = 4.0
    return 3.0 + i
}

func foo4(): Float64 {
    return 3.0 + 4.0
}

main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    var res3: Float32 = foo3()
    var res4: Float64 = foo4()
    if (res1 != 4 || res2 != 5 || res3 != 7.0 || res4 != 7.0) {
        return 1
    }
    return 0
}
