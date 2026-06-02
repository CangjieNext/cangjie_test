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
    public A(var b!: Int32 = 0) {
    }
}

extend A {
    public static func me(b: Int32): A {
        return A()
    }
}

main(): Int64 {
    return Int64(A.me(3).b)
}
