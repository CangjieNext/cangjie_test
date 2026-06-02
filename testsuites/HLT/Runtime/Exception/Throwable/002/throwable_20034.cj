/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// (not O2) ASSERT: scan throwable_20034.cj:36
var RES = ""

class A <: Exception {
    public override prop message: String {
        get() {
            RES = RES + "a"
            return "my_exception"
        }
    }
    public override func toString(): String {
        RES = RES + "b"
        return "my_exception"
    }
}

class B {
    public var b: Int64 = 0
    public init() {
        b = test(1)
    }
    public func test(x: Int64):Int64 {
        var res = 3
        throw A()
        return res
    }
}

main() {
    var exit_code = B().b
    return 0
}
