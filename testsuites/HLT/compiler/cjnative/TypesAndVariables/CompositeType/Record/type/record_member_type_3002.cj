/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Test1<T> {
    public let a: T
    public init(x: T) {
        a = x
    }
}

struct Test2 {
    public let recTest1: Test1<Int32>
    public init(x: Test1<Int32>) {
        recTest1 = x
    }
}

func run(): Int64 {
    var i: Int32 = 5
    var test1: Test1<Int32> = Test1<Int32>(i)
    let recTest1: Test1<Int32> = Test2(test1).recTest1
    var res: Int32 = recTest1.a
    if (res == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
