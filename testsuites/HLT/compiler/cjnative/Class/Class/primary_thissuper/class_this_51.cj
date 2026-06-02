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
        var c = Test.bar(this)
        return c
    }
    public static func bar(t: Test): Int32 {
        var i = t.a + 1
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
        var c: T = Data<T>.bar(this)
        return c
    }
    public static func bar(d: Data<T>): T {
        return d.b
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3, 5)
    var res1: Int32 = test.foo()
    var res2: Int32 = data.foo()
    if (res1 == 3 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
