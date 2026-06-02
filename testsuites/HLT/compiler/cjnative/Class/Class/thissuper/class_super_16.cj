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
    public open func foo(): Int32 {
        return 3
    }
}

class Test <: Base<Int32> {
    public func f(): Int32 {
        return super.foo() + 1
    }
}

class Data<T> <: Base<T> {
    public func f(): Int32 {
        return super.foo() + 2
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.f()
    var res2: Int32 = data.f()
    if (res1 == 4 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
