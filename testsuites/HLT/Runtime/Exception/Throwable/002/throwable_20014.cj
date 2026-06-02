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
// (not O2) ASSERT: scan throwable_20014.cj:35
class A <: Exception {
    public override prop message: String {
        get() {
            return "a"
        }
    }
    public override func toString(): String {
        return "b"
    }
}

class B {
    public func test():Unit{
        throw A()
    }
}

main() {
    var a = A()
    var res = 3
    try {
        B().test()
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
