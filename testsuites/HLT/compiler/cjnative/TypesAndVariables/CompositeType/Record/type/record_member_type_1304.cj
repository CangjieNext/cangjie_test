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
    public func getTest2<V>(x: V): V {
        return x
    }
}

struct Test2<T> {
    public let area: T
    public init(x: T) {
        area = x
    }
    public func getVol<V>(x: V): V {
        return x
    }
}

struct Test3 {
    public let i: Int32 = 2
    public let test1: Test1<Int32> = Test1<Int32>(i)
    public let width: Int32 = test1.width
    public let i2: Int32 = 4
    public let test2: Test2<Int32> = Test2<Int32>(i2)
    public let test2_1: Test2<Int32> = test1.getTest2<Test2<Int32>>(test2)
    public let area: Int32 = test2_1.area
    public let i3: Int32 = 6
    public let vol: Int32 = test2_1.getVol<Int32>(i3)
}

func run(): Int64 {
    let res1: Int32 = Test3().width
    let res2: Int32 = Test3().area
    let res3: Int32 = Test3().vol
    if (res1 == 2 && res2 == 4 && res3 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
