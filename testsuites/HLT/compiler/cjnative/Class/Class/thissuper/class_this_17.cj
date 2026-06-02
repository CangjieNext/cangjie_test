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
    public func foo(x: Int32): String {
        return x.toString()
    }
}

class Test <: Base {
    public var a: String = "hello"
    public func f(x: Int32) {
        a = this.foo(x)
    }
}

class Data<T> <: Base {
    public var a: String = "CharLang"
    public func f(x: Int32) {
        a = this.foo(x)
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    test.f(3)
    data.f(4)
    var res1: String = test.a
    var res2: String = data.a
    if (res1 == "3" && res2 == "4") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
