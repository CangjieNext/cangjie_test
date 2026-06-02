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
    public static var a: Int32 = 5
}

extend A {
    public static func me() {
        return 0
    }

    public static func me(a: Int32) {
        return a
    }

    public static func me(a: Int32, b: Int32) {
        return a + b
    }
}

main(): Int64 {
    return A.me() + Int64(A.me(1) + A.me(0, -1))
}
