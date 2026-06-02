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

func foo1(x: Int32): Int8 {
    var i: Int8 = 3
    if (x > 3) {
        return i + 1
    } else {
        return 3 - 1
    }
}

func foo2(x: Float16): Float32 {
    var f: Float32 = 3.14
    if (x > 3.0) {
        return 3.0 + 1.0
    } else {
        return f + 0.02
    }
}

main(): Int64 {
    var res1: Int8 = foo1(4)
    var res2: Int8 = foo1(2)
    var res3: Float32 = foo2(3.1)
    var res4: Float32 = foo2(2.9)

    if (res1 != 4 || res2 != 2 || res3 != 4.0 || res4 != 3.16) {
        return 1
    }
    return 0
}
