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
    public init(x: Int32) {
        i = x
        this
    }
}

class Data<T> {
    public var i: T
    public init(x: T) {
        i = x
        this
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var data: Data<Int32> = Data<Int32>(4)
    return 0
}

main(): Int64 {
    return run()
}
