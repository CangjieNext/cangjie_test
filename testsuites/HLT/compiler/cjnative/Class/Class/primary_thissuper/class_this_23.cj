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

abstract class FaTest {
    public var a: Int32 = 0
    public func f(x: Int32): Int32
}

class Test <: FaTest {
    public init() {}
    public Test(x: Int32) {
        this.a = this.f(x)
    }
    public func f(x: Int32): Int32 {
        return x + 1
    }
}

abstract class FaData<T> {
    public var b: T
    public FaData(b: T) {
        this.b = b
    }
    public func f(x: T): T
}

class Data<T> <: FaData<T> {
    public Data(x: T, y: T) {
        super(x)
    }
    public init(x: T) {
        this(x, x)
        this.b = this.f(x)
    }
    public func f(x: T): T {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: Int32 = test.a
    var data: Data<Int32> = Data<Int32>(6)
    var res2: Int32 = data.b
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
