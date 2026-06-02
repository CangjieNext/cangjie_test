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
    public var b: Int32 = 0
    public Test() {}
    public init(x: Int32) {
        this()
        b = foo(this.a)
    }
    public func foo(x: Int32): Int32 {
        var i = x + 1
        return i
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public Data(x: T) {
        this.a = x
        this.b = x
    }
    public init(x: T, y: T) {
        this(x)
        a = x
        b = foo(this.a, y)
    }
    public func foo(x: T, y: T): T {
        return y
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3, 5)
    var res1: Int32 = test.a
    var res2: Int32 = test.b
    var res3: Int32 = data.a
    var res4: Int32 = data.b
    if (res1 == 2 && res2 == 3 && res3 == 3 && res4 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
