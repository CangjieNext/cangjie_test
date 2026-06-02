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

struct Data<T> {
    public let a: T
    public init(x: T) {
        a = x
    }
}

class Test {
    public let data1: Data<Int32> = Data<Int32>(2)
    public let data2: Data<Int32>
    public init(x: Data<Int32>) {
        data2 = x
    }
    public func f(x: Data<Int32>): Data<Int32> {
        return x
    }
}

func run(): Int64 {
    var d1: Data<Int32> = Data<Int32>(3)
    var d2: Data<Int32> = Data<Int32>(4)
    var test: Test = Test(d1)
    let res1: Data<Int32> = test.data1
    let res2: Data<Int32> = test.data2
    let res3: Data<Int32> = test.f(d2)
    if (res1.a == 2 && res2.a == 3 && res3.a == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
