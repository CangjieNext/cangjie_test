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
    public init() {
        i = i + 1
    }
    public init(i: Int32) {
        this()
        this.i = i + 3
    }
}

class Data<T> {
    public var i1: T
    public init(i1: T) {
        this.i1 = i1
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.i
    var res2: Int32 = data.i1
    if (res1 == 5 && res2 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
