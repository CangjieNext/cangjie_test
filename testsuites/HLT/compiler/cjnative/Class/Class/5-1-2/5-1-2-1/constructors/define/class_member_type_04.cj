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
    public var a: Bool = true
    public var b: Bool
    public init(x: Bool) {
        b = x
    }
    public func f(x: Bool): Bool {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(false)
    var res1: Bool = test.a
    var res2: Bool = test.b
    var res3: Bool = test.f(false)
    if (res1 && !res2 && !res3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
