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
    public func foo(x: Int32): Int32 {
        this.b = 4
        return this.a + this.b + x
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public init(x: T) {
        a = x
        b = x
    }
    public func foo(y: T): T {
        this.b = y
        return this.b
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.foo(2)
    var res2: Int32 = data.foo(5)
    if (res1 == 8 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
