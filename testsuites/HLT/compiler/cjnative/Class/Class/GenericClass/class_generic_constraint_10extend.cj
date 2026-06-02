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

interface Add<T> {
    func autoInc(left: Int64, step: T): Int64
}

extend Int64 <: Add<Int32> {
    public func autoInc(left: Int64, step: Int32): Int64 {
        return left + Int64(step)
    }
}

class Data<T1> where T1 <: Add<Int32> {
    public var x: T1
    public init(a: T1) {
        x = a
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    let res1: Int64 = 1.autoInc(data.x, 3)
    let res2: Int64 = 1.autoInc(data.x, 4)
    if (res1 == 7 && res2 == 8) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
