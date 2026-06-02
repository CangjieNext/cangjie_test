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
    public var i: Int32 = 2
    public open func foo(x: Int32): Int32 {
        return x + 1
    }
}

class Test <: Base<Int32> {
    public static func f(x: Int32): Int32 {
        return x + 1
    }
    public override func foo(x: Int32): Int32 {
        var i = Test.f(super.i)
        return i + x
    }
}

class Data<T> <: Base<T> {
    public static func f(x: Int32): Int32 {
        return x + 1
    }
    public override func foo(x: Int32): Int32 {
        var i = Data<T>.f(super.i)
        return i + x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.foo(2)
    var res2: Int32 = data.foo(3)
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
