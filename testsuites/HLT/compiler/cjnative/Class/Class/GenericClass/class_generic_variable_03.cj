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
    public init(x: T) {
        super(0)
        a = x
        f = this.a
    }
}

main(): Int64 {
    var i: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if (res1 == 4 && res2 == 4) {
        return 0
    }
    return 1
}
