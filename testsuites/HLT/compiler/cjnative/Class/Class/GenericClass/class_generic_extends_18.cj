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
    public init(x: T) {}
    public func foo<V>(x: V, y: V): V {
        return x
    }
}

class Data<T> <: Base<T> {
    public init(input: T) {
        super(input)
    }
    public func foo<U>(x: U, y: U, z: U): U {
        return z
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(1)
    var res: Int32 = data.foo<Int32>(3, 4, 5)
    if (res == 5) {
        return 0
    }
    return 1
}
