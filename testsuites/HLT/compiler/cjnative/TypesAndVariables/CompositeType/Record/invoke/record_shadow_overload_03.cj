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

struct Test<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
    public func area<T>(res: T) {
        return res
    }
}

func run(): Int64 {
    var i1: Int32 = 2
    var i2: Int64 = 4
    var test: Test<Int32> = Test<Int32>(i1)
    var area: Int64 = test.area<Int64>(i2)
    var res: Int32 = test.a
    if (res == 2 && area == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
