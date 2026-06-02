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
    public var g: Int32 = 0
    public init(input: T) {
        super(Int32(0))
        f = input
        g = this.getNum<Int32>(3)
    }
    public func getNum<V>(x: V): V {
        return x
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    var res1: Int64 = data.f
    var res2: Int32 = data.g
    if (res1 == 4 && res2 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
