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

func foo(x: Int32): Int32 {
    return x + 1
}

class Test {
    public var f1: (Int32) -> Int32 = foo
    public var f2: (Int32) -> Int32
    public init(x: (Int32) -> Int32) {
        f2 = x
    }
    public func f3(x: (Int32) -> Int32): (Int32) -> Int32 {
        return x
    }
}

func run(): Int64 {
    var i: Int32 = 2
    var test: Test = Test(foo)
    let res1: Int32 = test.f1(i)
    let res2: Int32 = test.f2(i + 1)
    let res3: Int32 = test.f3(foo)(i)
    if (res1 == 3 && res2 == 4 && res3 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
