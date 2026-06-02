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
    public var i: Int32
    public Test(x: Int32, y: Int32) {
        i = x
    }
    public init(x: Int32) {
        this(x, 0)
        i = x + 2
        this
    }
}

class Data<T> {
    public var i: T
    public Data(x: T, y: T) {
        i = x
    }
    public init(x: T) {
        this(x, x)
        i = x
        this
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var data: Data<Int32> = Data<Int32>(4)
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if (res1 == 5 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
