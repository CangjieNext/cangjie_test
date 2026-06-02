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
    public func foo(): Test {
        return this
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public Data(x: T, y: T) {
        a = x
        b = y
    }
    public func foo(): Data<T> {
        return this
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3, 5)
    var res1: Test = test.foo()
    var res2: Data<Int32> = data.foo()
    if (res1.a == 2 && res2.b == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
