/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ab
// (not O2) ASSERT: scan throwable_20033.cj:37
var RES = ""

class A <: Exception {
    public override prop message: String {
        get() {
            RES = RES + "a"
            return "a"
        }
    }
    public override func toString(): String {
        RES = RES + "b"
        return "b"
    }
}

class B {
    public var b: Int64 = 0
    public init() {
        b = test(1)
    }
    public func test(x: Int64):Int64 {
        var res = 3
        try {
            throw A()
        } catch (e: A) {
            print(e.message)
            print(e.toString())
            e.printStackTrace()
            return res
        } finally {
            res = 0
            return res
        }
        res = 4
        return res
    }
}

main() {
    var exit_code = B().b
    if (exit_code != 0) {
        return exit_code
    }
    if (RES != "abb") {
        print("\nRES IS: " + RES + "\n")
        print("SHOULD BE: abb\n")
        return 6
    }
    return 0
}
