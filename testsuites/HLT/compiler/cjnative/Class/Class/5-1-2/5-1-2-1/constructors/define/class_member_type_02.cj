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
    public var a: Int32 = 2147483647
    public var b: Int32
    public init(x: Int32) {
        b = x
    }
    public func f(x: Int32): Int32 {
        return x + 1
    }
}

func run(): Int64 {
    var test: Test = Test(-2147483648)
    var res1: Int32 = test.a
    var res2: Int32 = test.b
    var res3: Int32 = test.f(3)
    if (res1 == 2147483647 && res2 == -2147483648 && res3 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
