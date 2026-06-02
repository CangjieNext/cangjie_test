/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
Test2.foo
Test1.foo
 */

class Test2 {
    public static var ti: Int32 = 99
    public var tl: Int64 = 0
    public static func foo(): Unit {
        print("Test2.foo\n")
        Test1.foo()
    }
}

class Test1 {
    public static var ti: Int32 = Test2.ti
    public var tl: Int64 = 0
    public static func foo(): Unit {
        print("Test1.foo\n")
    }
}

main(): Int64 {
    Test2.foo()
    return 0
}
