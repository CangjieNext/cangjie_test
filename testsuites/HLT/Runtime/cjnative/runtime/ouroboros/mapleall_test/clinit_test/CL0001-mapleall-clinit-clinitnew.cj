/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Test2.foo 99

class Test2 {
    public static var ti: Int32 = 99

    public static func foo(): Unit {
        print("Test2.foo " + ti.toString())
    }
}

main(): Int64 {
    Test2.foo()
    return 0
}
