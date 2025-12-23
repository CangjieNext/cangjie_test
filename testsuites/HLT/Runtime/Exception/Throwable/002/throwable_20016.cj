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
// (not iOS) ASSERT: scan-not before!
// (not (CJNATIVE and O2) and not iOS) ASSERT: regex init
// (not (CJNATIVE and O2) and not iOS) ASSERT: regex default.*B
// (not O2 and not iOS) ASSERT: scan throwable_20016.cj:25

class A <: Exception {}

class B {
    public static var b:Int64 = test(1)
    public static func test(x: Int64):Int64 {
        if (x == 1) {
            throw A()
        }
        return x
    }
}

main() {
    try {
        print("before!") // should not print.
        B.test(1)
        print("after!")
    } catch (e: A) { // will not catch
        print("catch!")
        print(e.message)
        print(e.toString())
        e.printStackTrace()
    }
    return 0 // will not return 0.
}
