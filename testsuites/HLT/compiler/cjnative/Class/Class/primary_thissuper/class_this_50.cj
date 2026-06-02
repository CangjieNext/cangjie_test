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

class Test {
    public var a: Int32 = 2
    public var b: Int32 = 4
    public func foo(): Int32 {
        var c = this.bar(this.b)
        return c
    }
    public func bar(t: Int32): Int32 {
        var i = t + 1
        return i
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public Data(x: T, y: T) {
        a = x
        b = y
    }
    public func foo(): T {
        var c: T = this.bar(this.a)
        return c
    }
    public func bar(d: T): T {
        return d
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3, 5)
    var res1: Int32 = test.foo()
    var res2: Int32 = data.foo()
    if (res1 == 5 && res2 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
