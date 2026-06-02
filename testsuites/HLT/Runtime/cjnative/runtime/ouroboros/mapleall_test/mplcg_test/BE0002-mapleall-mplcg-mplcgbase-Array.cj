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
// ASSERT:scan 1111.0

import std.convert.*

class Array1 {
    public func test(x: Array<Int32>, y: Array<Int32>): Unit {
        if (x.size > y.size) {
            print(x[0].toString())
        } else {
            print(y[0].toString())
        }
    }

    public func test(x: Array<Float32>, y: Array<Float32>): Unit {
        if (x.size > y.size) {
            print(x[0].format(".1"))
        } else {
            print(y[0].format(".1"))
        }
    }
}

main(): Int64 {
    let i1: Array<Int32> = [1]
    let i2: Array<Int32> = [11, 12]
    let a: Array1 = Array1()
    a.test(i1, i2)
    let f1: Array<Float32> = [1.0, 2.0]
    let f2: Array<Float32> = [11.0, 12.0, 13.0, 14.0, 15.0, 16.0]
    a.test(f1, f2)
    return 0
}
