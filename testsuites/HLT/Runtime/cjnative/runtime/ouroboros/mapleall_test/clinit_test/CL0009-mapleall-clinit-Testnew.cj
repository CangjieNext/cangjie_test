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
// ASSERT:scan 0

class Test1 {
    public static var ti: Int32 = 97
    public var tl: Int64 = 0
    public static func foo(): Unit {
    }
}

class Test2 {
    public static var ti: Int32 = 97
    public var tl: Int64 = 0
    public static func foo(): Unit {
    }
}

main(): Int64 {
    var t1: Test1 = Test1()
    var t2: Test2 = Test2()
    print((0).toString())
    return 0
}
