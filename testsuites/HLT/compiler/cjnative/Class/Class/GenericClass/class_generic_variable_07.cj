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
    public var base: T
    public init(x: T) {
        base = x
    }
}

class Data<T> <: Base<Int32> {
    public var a: T
    public var f: T
    public init(input: T) {
        super(0)
        a = input
        f = a
    }
}

main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}
