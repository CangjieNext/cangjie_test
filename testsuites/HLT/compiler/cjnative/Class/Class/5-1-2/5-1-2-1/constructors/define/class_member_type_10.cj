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
    public var a: (Float64, String) = (3.14, "PIE")
    public var b: (Float64, String)
    public init(x: (Float64, String)) {
        b = x
    }
    public func f(x: (Float64, String)): (Float64, String) {
        return x
    }
}

func run(): Int64 {
    var tup1: (Float64, String) = (9.8, "g")
    var tup2: (Float64, String) = (2.71, "e")
    var test: Test = Test(tup1)
    var res1: (Float64, String) = test.a
    var res2: (Float64, String) = test.b
    var res3: (Float64, String) = test.f(tup2)
    if (res1[0] == 3.14 && res1[1] == "PIE" && res2[0] == 9.8 && res2[1] == "g" && res3[0] == 2.71 && res3[1] == "e") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
