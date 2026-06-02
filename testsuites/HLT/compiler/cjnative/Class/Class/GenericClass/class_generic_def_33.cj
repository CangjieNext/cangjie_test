/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data<T1, T2, T3> {
    public let b: T2
    public let c: T3
    public init(y: T2, z: T3) {
        b = y
        c = z
    }
}

func run(): Int64 {
    var b: Float64 = 2.2
    var c: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(b, c)
    var res1: Float64 = data.b
    var res2: Int32 = data.c
    if (res1 == 2.2 && res2 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
