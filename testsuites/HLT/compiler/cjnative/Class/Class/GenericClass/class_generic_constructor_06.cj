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

class Data<T> <: Base<T> {
    public var f: T
    public var g: T
    public init(input: T) {
        super(input)
        f = input
        g = super.a
    }
}

func run(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.f
    var res2: Int32 = data.g
    if (res1 == 4 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
