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
    public let width: T
    public init(x: T) {
        width = x
    }
    public func area<V>(x: V): V {
        return x
    }
}

struct Test2 {
    public var i: Int32 = 2
    public let test1: Test1<Int32> = Test1<Int32>(i)
    public let width: Int32 = test1.width
    public var i2: Int32 = 3
    public let area: Int32 = test1.area<Int32>(i2)
}

func run(): Int64 {
    let res1: Int32 = Test2().width
    let res2: Int32 = Test2().area
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
