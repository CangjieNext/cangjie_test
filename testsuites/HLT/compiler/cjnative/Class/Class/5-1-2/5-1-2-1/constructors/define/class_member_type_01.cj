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
    public let a: Rune = r'a'
    public var b: Rune
    public init(x: Rune) {
        b = x
    }
    public func f(x: Rune): Rune {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(r'b')
    var res1: Rune = test.a
    var res2: Rune = test.b
    var res3: Rune = test.f(r'c')
    if (res1 == r'a' && res2 == r'b' && res3 == r'c') {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
