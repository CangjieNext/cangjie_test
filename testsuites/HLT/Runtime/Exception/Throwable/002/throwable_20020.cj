/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) ASSERT: scan Failed to InitCJLibrary
// (not iOS) ASSERT: scan my_exception
// (not O2 and not iOS) ASSERT: scan throwable_20020.cj:31
class A <: Exception {
    public override prop message: String {
        get() {
            return "my_exception"
        }
    }
    public override func toString(): String {
        return "my_exception"
    }
}

struct B {
    public static var b:Int64 = test(1)
    public static func test(x: Int64):Int64 {
        if (x == 1) {
            throw A()
        }
        return x
    }
}

main() {
    var a = A()
    try {
        B.test(1)
        ()
    } catch (e: A) {
        print(e.message)
        print(e.toString())
        e.printStackTrace()
    }
    return 0
}
