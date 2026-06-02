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
    public var i: Int32 = 2
    public init() {}
    public init(x: Int32) {
        i = this.i + x
    }
}

class Data<T> {
    public var i1: T
    public var i2: T
    public init(x: T) {
        i2 = x
        i1 = this.i2
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    if (test.i == 4 && data.i1 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
