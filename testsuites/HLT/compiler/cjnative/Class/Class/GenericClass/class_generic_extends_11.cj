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
    public open func foo(x: Int32): String {
        return x.toString()
    }
}

class Data<T> <: Base<Int32> {
    public init(input: T) {
        super(0)
    }
    public override func foo(x: Int32): String {
        return (x + 1).toString()
    }
}

class Time<T> <: Base<T> {
    public init(input: T) {
        super(input)
    }
    public override func foo(x: Int32): String {
        return (x + 2).toString()
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var time: Time<Int32> = Time<Int32>(0)
    var res: String = data.foo(3)
    var res2: String = time.foo(3)
    if (res == "4" && res2 == "5") {
        return 0
    }
    return 1
}
