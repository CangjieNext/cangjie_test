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
    public let a: Int32
    public init(x: Int32) {
        a = x
    }
    public func f(x: Int32): Test {
        return Test(x)
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var res: Test = test.f(2)
    if (res.a == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
