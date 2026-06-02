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
    public var a: String = "Hello, Rune Lang"
    public var b: String
    public init(x: String) {
        b = x
    }
    public func f(x: String): String {
        return x + " world"
    }
}

func run(): Int64 {
    var test: Test = Test("Hello Rune Lang")
    var res1: String = test.a
    var res2: String = test.b
    var res3: String = test.f("Hello")
    if (res1 == "Hello, Rune Lang" && res2 == "Hello Rune Lang" && res3 == "Hello world") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
