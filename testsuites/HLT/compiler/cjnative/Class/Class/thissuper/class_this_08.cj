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
    public var a: String = ""
    public var b: (Int32) -> String = {a: Int32 => ""}
    public init() {}
    public init(x: Int32) {
        this()
        a = this.foo(x)
        b = this.foo
    }
    public func foo(x: Int32): String {
        return x.toString()
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: String = test.a
    var res2: String = test.b(4)
    if (res1 == "3" && res2 == "4") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
