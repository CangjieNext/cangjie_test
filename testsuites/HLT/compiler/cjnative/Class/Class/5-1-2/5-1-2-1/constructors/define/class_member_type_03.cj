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
    public var a: Float64 = 2.23e-308
    public var b: Float64
    public init(x: Float64) {
        b = x
    }
    public func f(x: Float64): Float64 {
        return x + 1.2
    }
}

func run(): Int64 {
    var test: Test = Test(-1.79e308)
    var res1: Float64 = test.a
    var res2: Float64 = test.b
    var res3: Float64 = test.f(3.14)
    if (res1 == 2.23e-308 && res2 == -1.79e308 && res3 == 4.34) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
