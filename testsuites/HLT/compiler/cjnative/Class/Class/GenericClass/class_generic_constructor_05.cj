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

open class Base<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Data<T> <: Base<Int32> {
    public var f: T
    public var g: Float32
    public init(input: T) {
        super(0)
        f = input
        g = 0.0
    }
    public init(input: T, i: Float32) {
        this(input)
        g = i
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var i2: Float32 = 2.333
    var data: Data<Int64> = Data<Int64>(i1, i2)
    var res1: Int64 = data.f
    var res2: Float32 = data.g
    if (res1 == 4 && res2 == 2.333) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
