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

open class Base {
    public var base: Int32 = 1
}

class Test <: Base {
    public var i: Int32 = 2
    public func foo(x: Int32): String {
        i = this.base + x
        return i.toString()
    }
}

class Data<T> <: Base {
    public var i: T
    public Data(x: T) {
        i = x
    }
    public func foo(x: Int32): Unit {
        this.base = x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(1)
    data.foo(4)
    var res1: String = test.foo(3)
    var res2: Int32 = data.base
    if (res1 == "4" && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
