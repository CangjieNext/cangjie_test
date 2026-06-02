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
    static func foo(): Int32 {
        1
    }
}

extend A <: I {
    public static func me() {
        return 0 + foo()
    }

    public static func me(a: Int32) {
        return a + foo()
    }

    public static func me(a: Int32, b: Int32) {
        return a + b + foo()
    }
}

main(): Int64 {
    return Int64(A.me() + A.me(1) + A.me(0, -1)) - 3
}
