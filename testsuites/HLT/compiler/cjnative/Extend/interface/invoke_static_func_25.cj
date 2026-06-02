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

class A {
    A(var a!: Int64 = 5) {
    }
}

interface I {
    static func foo() {
        1
    }
}

extend A <: I {
    public static func me(): Int64 {
        func me() {
            return 2
        }
        return foo()
    }
}

main(): Int64 {
    return A.me() - 1
}
