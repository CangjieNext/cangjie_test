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

interface Data {
    static func foo(a: Int64): Int64
}

interface Data2 {
    static func foo(a: Bool): Int64
}

interface Data3 {
    static func foo(): Int64 {
        return 1
    }
}

class Test <: Data & Data2 & Data3 {
    public static func foo(a: Int64): Int64 {
        return a
    }

    public static func foo(a: Bool): Int64 {
        if (a) {
            return 1
        }
        return 0
    }
}

main(): Int64 {
    var res1: Int64 = Test.foo(2)
    var res2: Int64 = Test.foo(true)
    if (res1 != 2 || res2 != 1) {
        return 1
    }
    return 0
}
