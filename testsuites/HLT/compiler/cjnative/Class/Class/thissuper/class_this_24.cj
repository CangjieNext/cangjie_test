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
    public func foo() {
        return this.f(3)
    }

    public func f(x: Int32): Int32
}

class Test <: FaTest {
    public func f(x: Int32): Int32 {
        return x + 1
    }
}

abstract class FaData<T> {
    public func foo() {
        return this.f(4)
    }
    public func f(x: Int32): Int32
}

class Data <: FaData<Int32> {
    public func f(x: Int32): Int32 {
        return x + 2
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.foo()
    var data: Data = Data()
    var res2: Int32 = data.foo()
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
