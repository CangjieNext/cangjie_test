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
    public func foo(x: Int32): String {
        return x.toString()
    }
}

class Data<T> <: Base<T> {
    public init(input: T) {
        super(input)
    }
    public func foo(x: Int32, y: Int32): String {
        return (x + y).toString()
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: String = data.foo(3, 4)
    if (res == "7") {
        return 0
    }
    return 1
}
